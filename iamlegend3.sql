CREATE DATABASE  IF NOT EXISTS `iamlegend3` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `iamlegend3`;
-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: iamlegend3
-- ------------------------------------------------------
-- Server version	5.5.49-log

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
-- Table structure for table `ammunition`
--

DROP TABLE IF EXISTS `ammunition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ammunition` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  `weight` float DEFAULT NULL,
  `MSRP` float DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `image` varchar(45) DEFAULT NULL,
  `weapon_id` int(11) DEFAULT NULL,
  `cart_id` int(11) DEFAULT NULL,
  `caliber` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ammunition_cart_id_idx` (`cart_id`),
  KEY `fk_ammunition_weapon_id_idx` (`weapon_id`),
  CONSTRAINT `fk_ammunition_weapon_id` FOREIGN KEY (`weapon_id`) REFERENCES `weapon` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_cart_id` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ammunition`
--

LOCK TABLES `ammunition` WRITE;
/*!40000 ALTER TABLE `ammunition` DISABLE KEYS */;
INSERT INTO `ammunition` VALUES (4000,'5.56x45mm','NATO',0.0168571,0.23,200,'images/ammo/1.jpg',NULL,NULL,'5.56x45mm'),(4001,'10mm','Auto',0.0178571,0.45,200,'images/ammo/2.jpg',NULL,NULL,'10mm'),(4002,'11.43x23mm','.45 Automatic Colt Pistol',0.0178571,0.0328571,200,'images/ammo/3.jpg',NULL,NULL,'11.43x23mm'),(4003,'7.62x51mm','NATO',0.0215714,0.59,200,'images/ammo/4.jpg',NULL,NULL,'7.62x51mm'),(4004,'9x19mm','Parabellum',0.0177143,0.625,200,'images/ammo/5.jpg',NULL,NULL,'9x19mm'),(4005,'12.7x33mm','.5 Action Express',0.0428571,0.917,200,'images/ammo/6.jpg',NULL,NULL,'12.7x33mm'),(4006,'0.45','G.A.P.',0.0328571,1.417,200,'images/ammo/7.jpg',NULL,NULL,'0.45'),(4007,'5.7x28mm','FN Herstal',0.00571429,0.4518,200,'images/ammo/8.jpg',NULL,NULL,'5.7x28mm'),(4008,'12.7x99mm','.5 Browning Machine Gun',0.0942857,4.9599,200,'images/ammo/9.jpg',NULL,NULL,'12.7x99mm'),(4009,'7.62x54mm','',0.0328571,0.25,200,'images/ammo/10.jpg',NULL,NULL,'7.62x54mm'),(4010,'7.92x57mm','Mauser',0.0242857,0.57,200,'images/ammo/11.jpg',NULL,NULL,'7.92x57mm'),(4011,'0.338','Lapua Magnum',0.0285714,0.210637,200,'images/ammo/12.jpg',NULL,NULL,'0.338'),(4012,'12 Gauge','Shotgun shell',0.0621429,0.718,200,'images/ammo/13.jpg',NULL,NULL,'12 Gauge'),(4013,'9x33mmR','.357 Magnum',0.0178571,0.3,200,'images/ammo/14.jpg',NULL,NULL,'9x33mmR'),(4014,'7.62x39mm','Type 81',0.0175714,0.26,200,'images/ammo/15.jpg',NULL,NULL,'7.62x39mm');
/*!40000 ALTER TABLE `ammunition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` enum('EMPTY','SAVED','FULL','CHECKOUT','PURCHASED') CHARACTER SET latin1 DEFAULT NULL,
  `survival_score` int(11) DEFAULT NULL,
  `customer_account_number` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_customer_account_number_idx` (`customer_account_number`),
  CONSTRAINT `fk_customer_account_number` FOREIGN KEY (`customer_account_number`) REFERENCES `customer` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (1,'EMPTY',20,536345828);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `id` int(11) NOT NULL,
  `account_balance` int(11) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `first_name` varchar(45) DEFAULT NULL,
  `middle_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `age` float DEFAULT NULL,
  `height` float DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  `zipcode` int(11) DEFAULT NULL,
  `access_level` enum('LOGOUT','GUEST','BASIC','ADMIN') DEFAULT 'GUEST',
  `geoData` varchar(45) DEFAULT NULL,
  `security_question_1` varchar(45) DEFAULT NULL,
  `security_question_2` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (274729389,1400,'aaron@gmail.com','Aaron1','Aaron','Keala','Aguil',29,70,200,96797,'BASIC','NULL','NULL','NULL'),(536345828,1500,'micahel.a.williams@mawfia.com','Password0','Donna','Michelle','Williams',37,68,140,75060,'BASIC','NULL','NULL','NULL'),(774171271,5000,'admin@admin.com','Password0','Michael','Andrew','Williams',35,71,175,75060,'ADMIN','NULL',NULL,NULL),(1921168174,1000,'mawfia@gmail.com','Password0','George','','Washington',68,78,250,60606,'BASIC','NULL','NULL','NULL');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipment`
--

DROP TABLE IF EXISTS `equipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `equipment` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  `weight` float DEFAULT NULL,
  `MSRP` float DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `category` enum('Bag','Tool','MISC','Electronics','Medical') DEFAULT NULL,
  `cart_id` int(11) DEFAULT NULL,
  `image` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_equipment_cart_id_idx` (`cart_id`),
  CONSTRAINT `fk_equipment_cart_id` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipment`
--

LOCK TABLES `equipment` WRITE;
/*!40000 ALTER TABLE `equipment` DISABLE KEYS */;
INSERT INTO `equipment` VALUES (3000,'Hello Kitty Backpack','Hello Kitty Backpack',1,12,15,'Bag',NULL,'images/equipment/0.jpg'),(3001,'U.S. Military Surplus A.L.I.C.E. Pack, New','U.S. Military Surplus A.L.I.C.E. Pack, New',3,75,15,'Bag',NULL,'images/equipment/1.jpg'),(3002,'ARC\'TERYX LEAF KHARD 60 Pack','ARC\'TERYX LEAF KHARD 60 Pack',6,350,15,'Bag',NULL,'images/equipment/2.jpg'),(3003,'Personal First Aid Kit','Personal First Aid Kit',1,25,15,'Medical',NULL,'images/equipment/3.jpg'),(3004,'Combat LifeSaver Kit','Combat LifeSaver Kit',3,89,15,'Medical',NULL,'images/equipment/4.jpg'),(3005,'Paramedic First Aid Kit','Paramedic First Aid Kit',4,234,15,'Medical',NULL,'images/equipment/5.jpg'),(3006,'Compass','Compass',0.25,8,15,'MISC',NULL,'images/equipment/6.jpg'),(3007,'matches(pack of 25)','matches(pack of 25)',0.1,1.25,15,'MISC',NULL,'images/equipment/7.jpg'),(3008,'fire starter','fire starter',0.25,7.99,15,'MISC',NULL,'images/equipment/8.jpg'),(3009,'rope','rope',1,16.5,15,'MISC',NULL,'images/equipment/9.jpg'),(3010,'Duct Tape','Duct Tape',0.75,2.5,15,'MISC',NULL,'images/equipment/10.jpg'),(3011,'multi-tool (Leatherman)','multi-tool (Leatherman)',0.5,35,15,'Tool',NULL,'images/equipment/11.jpg'),(3012,'candles(pack of 4)','candles(pack of 4)',0.25,3,15,'MISC',NULL,'images/equipment/12.jpg'),(3013,'flashlight','flashlight',1,7,15,'MISC',NULL,'images/equipment/11.jpg'),(3014,'tarp','tarp',1,12,15,'MISC',NULL,'images/equipment/13.jpg'),(3015,'tent','tent',5,98,15,'MISC',NULL,'images/equipment/14.jpg'),(3016,'Yurt','Yurt',12,560,15,'MISC',NULL,'images/equipment/15.jpg'),(3017,'sleeping bag','sleeping bag',3,115,15,'MISC',NULL,'images/equipment/16.jpg'),(3018,'pillow(temperpedic)','pillow(temperpedic)',1,45,15,'MISC',NULL,'images/equipment/17.jpg'),(3019,'radio','radio',1,21,15,'Electronics',NULL,'images/equipment/18.jpg');
/*!40000 ALTER TABLE `equipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `food`
--

DROP TABLE IF EXISTS `food`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `food` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  `weight` float DEFAULT NULL,
  `MSRP` float DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `image` varchar(45) DEFAULT NULL,
  `calories` float DEFAULT NULL,
  `food_type` enum('Perishable','NonPerishable') DEFAULT 'Perishable',
  `cart_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_food_cart_id_id_x` (`cart_id`),
  CONSTRAINT `fk_food_cart_id` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food`
--

LOCK TABLES `food` WRITE;
/*!40000 ALTER TABLE `food` DISABLE KEYS */;
INSERT INTO `food` VALUES (2000,'Anchovy, canned in brine','Anchovy fillets preserved by canning in brine',16,1,50,'images/food/0.jpg',59.3,'NonPerishable',NULL),(2001,'Apple, canned in syrup, pie filling','Round shaped fruit with either a green or red',21,1,50,'images/food/1.jpg',28,'NonPerishable',NULL),(2002,'Apricot, canned in intense sweetened liquid','Small, orange-coloured stone fruit canned in ',16,1,50,'images/food/2.jpg',27,'NonPerishable',NULL),(2003,'Apricot, canned in light syrup','Small, orange coloured stone fruit canned in ',12,1,50,'images/food/3.jpg',18,'NonPerishable',NULL),(2004,'Artichoke heart, canned in brine','Central edible portion of the unopened flower',4,1,50,'images/food/4.jpg',25,'NonPerishable',NULL),(2005,'Asparagus, canned in brine','Long crisp stem with a fragile feathery tip. ',10.5,1,50,'images/food/5.jpg',46,'NonPerishable',NULL),(2006,'Bamboo shoot, canned in water','Tender young shoots of an edible bamboo plant',4,1,50,'images/food/6.jpg',25,'NonPerishable',NULL),(2007,'Butter Beans, seeds & pod, canned, no added f','Green pod with creamy Yellow seeds. Cooked wi',15.5,1,50,'images/food/7.jpg',100,'NonPerishable',NULL),(2008,'Cannellini Beans, canned in brine','Small White bean, oval in shape, removed from',15.5,1,50,'images/food/8.jpg',150,'NonPerishable',NULL),(2009,'Green Beans, seeds & pod, canned, no added fa','Long, thin, green, crisp pod with small round',15.5,1,50,'images/food/9.jpg',34,'NonPerishable',NULL),(2010,'Lima Beans, canned','Flat kidney shaped bean that can be White or ',15.5,1,50,'images/food/10.jpg',216,'NonPerishable',NULL),(2011,'Mixed Beans (red kidney, lima & butter beans ','Three or four bean mix comprising red kidney,',15.5,1,50,'images/food/11.jpg',170,'NonPerishable',NULL),(2012,'Red Kidney Beans, canned in brine','Kidney shaped beans, canned in sweetened brin',16,1,50,'images/food/12.jpg',127,'NonPerishable',NULL),(2013,'Corned Beef, canned','Canned processed meat product containing cook',12,1,50,'images/food/13.jpg',52,'NonPerishable',NULL),(2014,'Beetroot, canned','Rounded root vegetable with dark brown-purple',4,1,50,'images/food/14.jpg',91,'NonPerishable',NULL),(2015,'Blueberry, canned in syrup','Small, deep blue berry with Whiteish waxy blo',15,1,50,'images/food/15.jpg',215,'NonPerishable',NULL),(2016,'Carrot, baby, canned in brine, boiled','Crisp root vegetable with orange flesh and gr',10.5,1,50,'images/food/16.jpg',30,'NonPerishable',NULL),(2017,'Cherry, black, canned in syrup','Small, deep reddish-purple stone fruit canned',21,1,50,'images/food/17.jpg',149,'NonPerishable',NULL),(2018,'Chickpea, canned in brine','Small, light coloured seed, removed from its ',12,1,50,'images/food/18.jpg',269,'NonPerishable',NULL),(2019,'Coconut, milk, canned','Canned liquid extract of the flesh of mature ',12,1,50,'images/food/19.jpg',445,'NonPerishable',NULL),(2020,'Crab meat, canned in brine','Flesh extracted from crabs and canned in brin',12,1,50,'images/food/20.jpg',82,'NonPerishable',NULL),(2021,'Vienna Sausage, canned, boiled','Canned frankfurt containing meat (including p',4,1,50,'images/food/21.jpg',260,'NonPerishable',NULL),(2022,'Fruit salad, canned in heavy syrup','Canned mixed fruit in sugar-based syrup, then',10.6,1,50,'images/food/22.jpg',70,'NonPerishable',NULL),(2023,'Ham, leg, canned','Canned leg ham containing pork, gelatine, sal',16,1,50,'images/food/23.jpg',463,'NonPerishable',NULL),(2024,'Herring, canned with salt','Herring fillets preserved by canning with sal',16,1,50,'images/food/24.jpg',73,'NonPerishable',NULL),(2025,'Kipper, canned','Kipper, preserved by canning, then .',16,1,50,'images/food/25.jpg',61,'NonPerishable',NULL),(2026,'Lychee, canned in light syrup','Small round to oval shaped fruit with a scaly',16,1,50,'images/food/26.jpg',125,'NonPerishable',NULL),(2027,'Mackerel, canned in brine','Mackerel fillets preserved by canning in brin',16,1,50,'images/food/27.jpg',85,'NonPerishable',NULL),(2028,'Mackerel, canned in oil','Mackerel fillets preserved by canning in edib',16,1,50,'images/food/28.jpg',44,'NonPerishable',NULL),(2029,'Mandarin, canned in syrup','Segments of a mandarin, canned in a sugar-bas',16,1,50,'images/food/29.jpg',80,'NonPerishable',NULL),(2030,'Milk, canned, evaporated, Regularular','Australian produced evaporated milk. Prepared',12,1,50,'images/food/30.jpg',200,'NonPerishable',NULL),(2031,'Mixed fruit, peach & pear, canned in light sy','Peaches and pears that have been canned in li',4,1,50,'images/food/31.jpg',60,'NonPerishable',NULL),(2032,'Mushroom, golden, Asian, canned in brine','Small, long-stemmed, Yellow-brown mushrooms, ',15,1,50,'images/food/32.jpg',30,'NonPerishable',NULL),(2033,'Mussel, smoked, canned in oil','Smoked mussels canned in edible oil and salt,',4,1,50,'images/food/33.jpg',110,'NonPerishable',NULL),(2034,'Oyster, smoked, canned in oil','Oyster flesh preserved by smoking and canning',4,1,50,'images/food/34.jpg',150,'NonPerishable',NULL),(2035,'Pea, processed, canned','A small round green seed, canned, then .',15.25,1,50,'images/food/35.jpg',70,'NonPerishable',NULL),(2036,'Peach, canned in syrup','Small stone fruit with a reddish/orange furry',15.25,1,50,'images/food/36.jpg',100,'NonPerishable',NULL),(2037,'Peach, canned, pie filling','Small stone fruit with a reddish/orange furry',21,1,50,'images/food/37.jpg',110,'NonPerishable',NULL),(2038,'Potato, new, canned, no added fat','Immature potatoes, small and round in shape, ',12,1,50,'images/food/38.jpg',60,'NonPerishable',NULL),(2039,'Salmon, chum, canned, without salt, solids wi','Flesh and bones of fish labelled as being pin',15.25,1,50,'images/food/39.jpg',39,'NonPerishable',NULL),(2040,'Salmon, pink, canned in brine','Flesh, bones and skin of fish labelled as pin',15.25,1,50,'images/food/40.jpg',38,'NonPerishable',NULL),(2041,'Salmon, pink, canned, smoked','Flesh, bones and skin of fish labelled as pin',15.25,1,50,'images/food/41.jpg',58,'NonPerishable',NULL),(2042,'Salmon, red, canned in brine','Flesh, bones and skin of fish labelled as red',15.25,1,50,'images/food/42.jpg',39,'NonPerishable',NULL),(2043,'Sardine, canned in oil','Sardines preserved by salting and canning in ',5,1,50,'images/food/43.jpg',73,'NonPerishable',NULL),(2044,'Sardine, canned in water, no added salt','Sardines preserved by canning in water, no ad',5,1,50,'images/food/44.jpg',58,'NonPerishable',NULL),(2045,'Sauerkraut, canned in brine','Fermented cabbage, preserved in brine in a ca',5,1,50,'images/food/45.jpg',0,'NonPerishable',NULL),(2046,'Soup, beef or lamb & vegetable, condensed, ca','Condensed soup containing beef or lamb and ve',10.5,1,50,'images/food/46.jpg',100,'NonPerishable',NULL),(2047,'Soup, beef, broth style, condensed, canned','Condensed beef broth style soup. Typical ingr',10.5,1,50,'images/food/47.jpg',15,'NonPerishable',NULL),(2048,'Soup, chicken & vegetable, condensed, canned','Condensed soup containing chicken and vegetab',10.5,1,50,'images/food/48.jpg',166,'NonPerishable',NULL),(2049,'Soup, chicken, broth style, condensed, canned','Condensed chicken broth style soup. Typical i',10.5,1,50,'images/food/49.jpg',20,'NonPerishable',NULL),(2050,'Soup, creamed chicken, condensed, canned','Condensed creamed chicken soup. Typical ingre',10.5,1,50,'images/food/50.jpg',110,'NonPerishable',NULL),(2051,'Soup, creamed mushroom, condensed, canned','Condensed creamed mushroom soup. Typical ingr',10.5,1,50,'images/food/51.jpg',90,'NonPerishable',NULL),(2052,'Soup, minestrone, condensed, canned','Condensed minestrone soup. Requires dilution ',10.5,1,50,'images/food/52.jpg',100,'NonPerishable',NULL),(2053,'Soup, pea & ham, condensed, canned','Condensed pea and ham soup. Requires dilution',16,1,50,'images/food/53.jpg',160,'NonPerishable',NULL),(2054,'Soup, tomato, condensed, canned','Condensed tomato soup. Typical ingredients in',16,1,50,'images/food/54.jpg',110,'NonPerishable',NULL),(2055,'Spam, canned','Manufactured pork product containing chopped ',12,1,50,'images/food/55.jpg',180,'NonPerishable',NULL),(2056,'Sprouts, bean, canned, no added salt','Sprouted from mung bean seeds. Long transluce',18,1,50,'images/food/56.jpg',110,'NonPerishable',NULL),(2057,'Sweetcorn, baby, canned in brine, , stir-frie','Baby (miniature) corn on the cob, canned in s',15.25,1,50,'images/food/57.jpg',60,'NonPerishable',NULL),(2058,'Tuna, canned in brine','Tuna flesh preserved by canning in brine. of ',15.25,1,50,'images/food/58.jpg',34,'NonPerishable',NULL),(2059,'Tuna, canned in vegetable oil','Tuna flesh canned in edible oil (including ol',15.25,1,50,'images/food/59.jpg',52,'NonPerishable',NULL),(2060,'Tuna, canned in water','Tuna, preserved by canning in water.',15.25,1,50,'images/food/60.jpg',32,'NonPerishable',NULL),(2061,'Tuna, smoked, canned in oil','Tuna, preserved by smoking and canning in oil',15.25,1,50,'images/food/61.jpg',55,'NonPerishable',NULL);
/*!40000 ALTER TABLE `food` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  `weight` float DEFAULT NULL,
  `MSRP` float DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `image` varchar(45) DEFAULT NULL,
  `cart_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_item_cart_id_idx` (`cart_id`),
  CONSTRAINT `fk_item_cart_id` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `optic`
--

DROP TABLE IF EXISTS `optic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `optic` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  `weight` float DEFAULT NULL,
  `MSRP` float DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `image` varchar(45) DEFAULT NULL,
  `magnification` varchar(45) DEFAULT NULL,
  `weapon_id` int(11) DEFAULT NULL,
  `cart_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_optic_cart_id_idx` (`cart_id`),
  KEY `fk_optic_weapon_id_idx` (`weapon_id`),
  CONSTRAINT `fk_optic_cart_id` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_optic_weapon_id` FOREIGN KEY (`weapon_id`) REFERENCES `weapon` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `optic`
--

LOCK TABLES `optic` WRITE;
/*!40000 ALTER TABLE `optic` DISABLE KEYS */;
INSERT INTO `optic` VALUES (5000,'ZRAK ON-M76 Optic','Magnification:  ZRAK Power: Tiritium',0.7,215,5,'images/optic/0.jpg','6',NULL,NULL),(5001,'telescopic SUSAT/ACOG','Magnification: 4x Power: Tritium',0.919,795,5,'images/optic/1.jpg','4',NULL,NULL),(5002,'swarovski PH 1.5-6x42SR','Magnification: 1.5-6x Power: None',1.09,1599,5,'images/optic/2.jpg','1.5-6',NULL,NULL),(5003,'schmidt and bender PM II 3','Magnification: 3-12x',1.89,3789,5,'images/optic/3.jpg','12',NULL,NULL),(5004,'NightForce w/BORS','Magnificatino: 5.5-22x Power: CR-123',0.8125,1399,5,'images/optic/4.jpg','5.5-22',NULL,NULL),(5005,'Leupold VX-III ','Magnification: 4.5-14 Power: None',0.94,549,5,'images/optic/5.jpg','4.5-14',NULL,NULL),(5006,'leuopold  & stevens Ultra Mark 4 M3','Magnification: 10x',1.38,1200,5,'images/optic/6.jpg','10',NULL,NULL),(5007,'aimpoint compc3','Magnification: 1x Power: One 3 Volt Lithium b',0.4375,500,5,'images/optic/7.jpg','1',NULL,NULL),(5008,'Trijicon ACOG','Magnification: 4x Power:Tritium',0.935,2155,5,'images/optic/8.jpg','4',NULL,NULL);
/*!40000 ALTER TABLE `optic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weapon`
--

DROP TABLE IF EXISTS `weapon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `weapon` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  `weight` float DEFAULT NULL,
  `MSRP` float DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `image` varchar(45) DEFAULT NULL,
  `manufactuer` varchar(45) DEFAULT NULL,
  `weapon_type` enum('AssaultRifle','Rifle','SubMachineGun','MachineGun','SniperRifle','Pistol','Shotgun','NonMechanical') DEFAULT NULL COMMENT '''AssaultRifle'', ''Rifle'', ''SubMachineGun'', ''MachineGun'', ''SniperRifle'', ''Pistol'', ''Shotgun'', ''NonMechanical''',
  `country_of_origin` varchar(45) DEFAULT NULL,
  `production_year` int(11) DEFAULT NULL,
  `length` varchar(45) DEFAULT NULL,
  `barrel_length` varchar(45) DEFAULT NULL,
  `rate_of_fire` varchar(45) DEFAULT NULL,
  `muzzel_velocity` varchar(45) DEFAULT NULL,
  `effective_firing_range` varchar(45) DEFAULT NULL,
  `maximum_firing_range` varchar(45) DEFAULT NULL,
  `ammunition` varchar(45) DEFAULT NULL,
  `optic` varchar(45) DEFAULT NULL,
  `cart_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_weapon_cart_id_idx` (`cart_id`),
  CONSTRAINT `fk_weapon_cart_id` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weapon`
--

LOCK TABLES `weapon` WRITE;
/*!40000 ALTER TABLE `weapon` DISABLE KEYS */;
INSERT INTO `weapon` VALUES (1000,'MP5','NULL',6.3,700,20,'images/weapon/0.jpg','heckler & koch','SubMachineGun','germany',1966,'19.3','8.9','800','1394','125','200',NULL,NULL,NULL),(1001,'uzi','NULL',7.72,500,20,'images/weapon/1.jpg','israel military industries','SubMachineGun','israel',1948,'17.5','10.2','600','1312.34','656.168','NULL',NULL,NULL,NULL),(1002,'tec-9','NULL',3.08647,500,20,'images/weapon/2.jpg','intratec','SubMachineGun','sweden',1985,'12.4803','5','NULL','1181','160','NULL',NULL,NULL,NULL),(1003,'mac-10','NULL',6.26,450,20,'images/weapon/3.jpg','military armament coporation','SubMachineGun','united states',1970,'9.6','4.49','1090','919','164.042','328.084',NULL,NULL,NULL),(1004,'UMP','NULL',5.8,700,20,'images/weapon/4.jpg','heckler & koch','SubMachineGun','germany',1999,'17.7','8','650','935','328.084','328.084',NULL,NULL,NULL),(1005,'Steyr Aug A3','NULL',7.9,1800,20,'images/weapon/5.jpg','Steyr Mannlicher','AssaultRifle','austria',2014,'31.1','20','680-750','3182','980','1600',NULL,NULL,NULL),(1006,'HK33A','NULL',8.05,2500,20,'images/weapon/6.jpg','hecklet & koch','AssaultRifle','germany',1960,'36.2','15.4','750','3117','1312','1312',NULL,NULL,NULL),(1007,'SA80','NULL',8.4,500,20,'images/weapon/7.jpg','BAE Systems','AssaultRifle','united kingdom',1994,'30.9','20.4','610-775','3051','1500','1000',NULL,NULL,NULL),(1008,'M4A1','NULL',6.36,700,20,'images/weapon/8.jpg','Colt manufacturing company','AssaultRifle','united states',1994,'33','14.5','700-950','2900','200-600','1640',NULL,NULL,NULL),(1009,'DPMS GII Recon','NULL',8.5,1759,20,'images/weapon/9.jpg','DPMS Firearms','AssaultRifle','united states',2014,'38','16','NULL','NULL','NULL','NULL',NULL,NULL,NULL),(1010,'DS Arms SA58 Mini OSW','NULL',9,1975,20,'images/weapon/10.jpg','DS Arms','AssaultRifle','united states',2015,'32.5','13','NULL','NULL','NULL','NULL',NULL,NULL,NULL),(1011,'FN FS2000 tactical','NULL',7.86,2779,20,'images/weapon/11.jpg','Fabrique Nationale de Herstal','AssaultRifle','belgium',2001,'29.29','17.44','850','2953','1600','NULL',NULL,NULL,NULL),(1012,'MR762A1','NULL',9.94,3999,20,'images/weapon/12.jpg','heckler & koch','AssaultRifle','united states',2014,'39.5','16.5','NULL','NULL','NULL','NULL',NULL,NULL,NULL),(1013,'IWI Tavor SAR','NULL',7.9,1999,20,'images/weapon/13.jpg','israel military industries','AssaultRifle','israel',2001,'26.13','18','750-900','2986','1600','NULL',NULL,NULL,NULL),(1014,'MasterPiece Arms MPAR556','NULL',7.8,950,20,'images/weapon/14.jpg','masterpiece arms','AssaultRifle','united states',2013,'38.25','16','NULL','NULL','NULL','NULL',NULL,NULL,NULL),(1015,'FN FAL','NULL',9.48,400,20,'images/weapon/15.jpg','Fabrique Nationale de Herstal','Rifle','belgium',1953,'43','21','650-700','2756','NULL','NULL',NULL,NULL,NULL),(1016,'Type 81','NULL',7.5,800,20,'images/weapon/16.jpg','china','Rifle','china',1983,'37.6','17.5','700-720','2461','280/500(CS/LR14)','1706.04',NULL,NULL,NULL),(1017,'M1A SOCOM 16','NULL',9.2,2186,20,'images/weapon/17.jpg','Springfield','Rifle','united states',2015,'37.25','16','NULL','NULL','NULL','NULL',NULL,NULL,NULL),(1018,'ARX100','NULL',6.8,1950,20,'images/weapon/18.jpg','Beretta','Rifle','united states',2015,'37.75','16','NULL','NULL','NULL','NULL',NULL,NULL,NULL),(1019,'ACR','NULL',9.8,2552,20,'images/weapon/19.jpg','bushmaster','Rifle','united states',2006,'35.5','18','800','3250','1640','1968.5',NULL,NULL,NULL),(1020,'LE901-16s','NULL',8.8,2544,20,'images/weapon/20.jpg','colt','Rifle','united states',2016,'37.5','16.1','NULL','NULL','NULL','NULL',NULL,NULL,NULL),(1021,'SIG716 patrol','NULL',9.3,2399,20,'images/weapon/21.jpg','Sig Sauer','Rifle','germany',2000,'38.3','16','NULL','NULL','NULL','NULL',NULL,NULL,NULL),(1022,'ak-103','NULL',7.5,1500,20,'images/weapon/22.jpg','izhmash','Rifle','russia',1994,'37.1','16.3','600','2346','1600','1650',NULL,NULL,NULL),(1023,'IMI galil','NULL',9.8,800,20,'images/weapon/23.jpg','israel military industries','Rifle','israel',1972,'41.3','21.1','630-750','2788','300-500','NULL',NULL,NULL,NULL),(1024,'kel-tec rfb','NULL',8.1,1888,20,'images/weapon/24.jpg','Kel-tec','Rifle','united states',2003,'26','18','NULL','2500','1600','1600',NULL,NULL,NULL),(1025,'92A','NULL',2.215,355,20,'images/weapon/25.jpg','Beretta','Pistol','italy',1975,'8.5','4.9','NULL','1250','160','NULL',NULL,NULL,NULL),(1026,'M1911','NULL',2.44,800,20,'images/weapon/26.jpg','Colt manufacturing company','Pistol','united states',1911,'8.25','0.41667','NULL','825','NULL','NULL',NULL,NULL,NULL),(1027,'Desert Eagle','NULL',4.4,1790,20,'images/weapon/27.jpg','magnum research','Pistol','united states',1982,'14.75','0.8333','NULL','1541.99','NULL','656.168',NULL,NULL,NULL),(1028,'Glock 39','NULL',1.2,405,20,'images/weapon/28.jpg','glock  ges.m.b.h','Pistol','austria',2000,'6.3','3.46','NULL','1230','164.042','NULL',NULL,NULL,NULL),(1029,'Five-Seven','NULL',1.3,1169,20,'images/weapon/29.jpg','Fabrique Nationale de Herstal','Pistol','belgium',2000,'8.2','4.8','NULL','2050','160.042','4954.068',NULL,NULL,NULL),(1030,'228 Sub Compact','NULL',1.82,800,20,'images/weapon/30.jpg','Sig Sauer','Pistol','germany',2012,'7.1','3.9','NULL','NULL','NULL','NULL',NULL,NULL,NULL),(1031,'p2000','NULL',1.36687,1000,20,'images/weapon/31.jpg','heckler & koch','Pistol','germany',2001,'6.8','3.7','NULL','1165','NULL','NULL',NULL,NULL,NULL),(1032,'M&P R8','NULL',0.79146,1300,20,'images/weapon/32.jpg','Smith & Wesson','Pistol','united states',2015,'10.5','5','NULL','NULL','NULL','NULL',NULL,NULL,NULL),(1033,'PK','NULL',19.84,1790,20,'images/weapon/33.jpg','Mikhail Kalashnikov','MachineGun','russia',1961,'47.4','23.8','650','2707','3280.84','12467.19',NULL,NULL,NULL),(1034,'M82','NULL',29.7,8900,20,'images/weapon/34.jpg','Beretta','MachineGun','united states',1989,'48','20','NULL','2799','1969','NULL',NULL,NULL,NULL),(1035,'IMI Negev','NULL',16.31,5500,20,'images/weapon/35.jpg','israel military industries','MachineGun','israel',1997,'40','18.1','1000','3002','984.252-3280.84','3280.84',NULL,NULL,NULL),(1036,'M249','NULL',17,3500,20,'images/weapon/36.jpg','Fabrique Nationale de Herstal','MachineGun','united states',1984,'40.75','18','100','3000','2296.59','11811.02',NULL,NULL,NULL),(1037,'M76','NULL',10,2200,20,'images/weapon/37.jpg','Zastava Arms','MachineGun','yugoslavia',1976,'44.7','22','NULL','2400','2624.67','NULL',NULL,NULL,NULL),(1038,'Dragunov SVD','NULL',9.48,900,20,'images/weapon/38.jpg','Izhmash','MachineGun','russia',1963,'48.2','24.4','30','2723','2624.67','NULL',NULL,NULL,NULL),(1039,'Longbow T-76','NULL',13.5,4300,20,'images/weapon/39.jpg','Dakata Arms','MachineGun','united states',1997,'50','28','NULL','2850','4593.176','5280',NULL,NULL,NULL),(1040,'M25','NULL',11,3200,20,'images/weapon/40.jpg','Springfield','MachineGun','united states',1991,'44.3','22','semi','NULL','NULL','2952.76',NULL,NULL,NULL),(1041,'M40','NULL',14.48,1000,20,'images/weapon/41.jpg','remington','MachineGun','united states',1966,'43.97','24','6','2550','2952.76','2952.76',NULL,NULL,NULL),(1042,'1301 Tactical 12 GA.','NULL',6.3,1075,20,'images/weapon/42.jpg','Beretta','Shotgun','united states',2016,'38','18.5','NULL','NULL','NULL','NULL',NULL,NULL,NULL),(1043,'ATI Bernelli M4','NULL',7.8,1999,20,'images/weapon/43.jpg','Raven System','Shotgun','italy',1998,'34.8','18.5','NULL','NULL','164','NULL',NULL,NULL,NULL),(1044,'Remington 870','NULL',7,1059,20,'images/weapon/44.jpg','remington arms','Shotgun','united states',1951,'37.25','14','NULL','NULL','NULL','NULL',NULL,NULL,NULL),(1045,'FN SLP MKI 12 Ga','NULL',8.2,1429,20,'images/weapon/45.jpg','Fabrique Nationale de Herstal','Shotgun','united states',2009,'43','22','semi','NULL','NULL','NULL',NULL,NULL,NULL),(1046,'MOLOT VEPR 12 GA','NULL',9.25942,1499,20,'images/weapon/46.jpg','Molot Oruzhie Ltd.','Shotgun','russia',2003,'38','20','NULL','NULL','NULL','NULL',NULL,NULL,NULL);
/*!40000 ALTER TABLE `weapon` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-12-05  4:50:42
