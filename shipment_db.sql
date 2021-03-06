CREATE DATABASE  IF NOT EXISTS `shipment_db` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `shipment_db`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: shipment_db
-- ------------------------------------------------------
-- Server version	5.6.38

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
-- Table structure for table `buyer`
--

DROP TABLE IF EXISTS `buyer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `buyer` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `Name` varchar(250) CHARACTER SET utf8 NOT NULL,
  `Phone` varchar(24) CHARACTER SET utf8 DEFAULT NULL,
  `CityID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_Bayer_City` (`CityID`),
  CONSTRAINT `FK_Bayer_City` FOREIGN KEY (`CityID`) REFERENCES `city` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buyer`
--

LOCK TABLES `buyer` WRITE;
/*!40000 ALTER TABLE `buyer` DISABLE KEYS */;
INSERT INTO `buyer` VALUES (1,'Tariq','0798808615',1),(2,'Fayez','0798888888',1),(3,'Farahteh','0777777777',2);
/*!40000 ALTER TABLE `buyer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `city` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(250) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` VALUES (1,'Amman'),(2,'Zarqa'),(3,'Irbid');
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facility`
--

DROP TABLE IF EXISTS `facility`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `facility` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `Name` varchar(250) CHARACTER SET utf8 NOT NULL,
  `CityID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_Facility_City` (`CityID`),
  CONSTRAINT `FK_Facility_City` FOREIGN KEY (`CityID`) REFERENCES `city` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facility`
--

LOCK TABLES `facility` WRITE;
/*!40000 ALTER TABLE `facility` DISABLE KEYS */;
INSERT INTO `facility` VALUES (1,'Amman Store',1),(2,'Zarqa Store',2),(3,'Ibrid Store',3);
/*!40000 ALTER TABLE `facility` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `Description` varchar(250) CHARACTER SET utf8 NOT NULL,
  `SellerID` bigint(20) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_Item_Seller` (`SellerID`),
  CONSTRAINT `FK_Item_Seller` FOREIGN KEY (`SellerID`) REFERENCES `seller` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (1,'Iphone 6 Gold',1),(2,'Iphone 8',1),(3,'Iphone 6 White',1),(4,'Hp Laptop',2),(5,'Dell Laptop',2);
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seller`
--

DROP TABLE IF EXISTS `seller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seller` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `Name` varchar(250) CHARACTER SET utf8 NOT NULL,
  `Phone` varchar(24) CHARACTER SET utf8 DEFAULT NULL,
  `CityID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_Seller_City` (`CityID`),
  CONSTRAINT `FK_Seller_City` FOREIGN KEY (`CityID`) REFERENCES `city` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seller`
--

LOCK TABLES `seller` WRITE;
/*!40000 ALTER TABLE `seller` DISABLE KEYS */;
INSERT INTO `seller` VALUES (1,'Ahmed','0788888888',1),(2,'Eyad','0777777777',2);
/*!40000 ALTER TABLE `seller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipmentd`
--

DROP TABLE IF EXISTS `shipmentd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shipmentd` (
  `ShipmentHID` bigint(20) NOT NULL,
  `ItemID` bigint(20) NOT NULL,
  PRIMARY KEY (`ShipmentHID`,`ItemID`),
  KEY `FK_ShipmentD_Item` (`ItemID`),
  CONSTRAINT `FK_ShipmentD_Item` FOREIGN KEY (`ItemID`) REFERENCES `item` (`ID`),
  CONSTRAINT `FK_ShipmentD_ShipmentH` FOREIGN KEY (`ShipmentHID`) REFERENCES `shipmenth` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipmentd`
--

LOCK TABLES `shipmentd` WRITE;
/*!40000 ALTER TABLE `shipmentd` DISABLE KEYS */;
INSERT INTO `shipmentd` VALUES (1482777770065,1),(3607659624563,1),(5966926862282,1),(5980060843563,1),(6717353723634,1),(9026873526901,1),(9234812241442,1),(1038643428808,2),(1040314516551,2),(1068144423730,2),(1086702972428,2),(1243348674009,2),(1371630786509,2),(1594101252438,2),(1614722330727,2),(1717710774044,2),(1839027869768,2),(1881127834256,2),(1973491547968,2),(2000420993506,2),(2043992044778,2),(2131817135189,2),(2142643996753,2),(2211541851331,2),(2220337543079,2),(2488632831864,2),(2499542436241,2),(2521265573744,2),(2552333894159,2),(2600842376425,2),(2659815355658,2),(2725462611828,2),(2901306596203,2),(2903605387270,2),(3010946729622,2),(3195038341872,2),(3335712831341,2),(3494778006589,2),(3575791217200,2),(3588395189117,2),(3597267500700,2),(3795516570049,2),(3830426786752,2),(3911908668598,2),(3977006383892,2),(4016274139628,2),(4098663822497,2),(4193161668488,2),(4227895536582,2),(4292784529389,2),(4312933459442,2),(4336866893814,2),(4343960113197,2),(4374485286922,2),(4500219445976,2),(4672779915148,2),(4678811458104,2),(4689819486167,2),(4836258219221,2),(4918917787906,2),(4949166314227,2),(4961455996479,2),(4974553108879,2),(4997632859958,2),(5038259801862,2),(5082048982961,2),(5104077854606,2),(5127755986091,2),(5163177414912,2),(5168470429850,2),(5232413581276,2),(5271999448519,2),(5480200575190,2),(5674369970944,2),(5813955804959,2),(5861857757473,2),(6050766805781,2),(6226901139617,2),(6245767553305,2),(6259524766994,2),(6292349758704,2),(6566311405222,2),(6579021594493,2),(6594884395635,2),(6605788896168,2),(6614062493370,2),(6634404113262,2),(6670766051711,2),(6726673748391,2),(6786588656871,2),(6919361871092,2),(6977002653308,2),(6978356067856,2),(7010881751927,2),(7086990192428,2),(7311642785802,2),(7337541363814,2),(7634847557785,2),(7638308611475,2),(7668335185837,2),(7680402504768,2),(7802082892534,2),(7835349236130,2),(7837082361038,2),(7842270430505,2),(7860112018813,2),(7946423819114,2),(7961064327588,2),(7984155848719,2),(8242168637329,2),(8281707159932,2),(8468143436658,2),(8652579115984,2),(8660113506236,2),(8674679114508,2),(8901946881340,2),(8960659778660,2),(9024474228631,2),(9091495406865,2),(9172640882377,2),(9198622466280,2),(9256532501147,2),(9348695371917,2),(9390878250279,2),(9518770996640,2),(9549577451517,2),(9615323037334,2),(9751277315703,2),(9904174315835,2),(9922379365258,2),(9940702602756,2),(9978611442054,2),(9994189144723,2),(1038643428808,3),(1040314516551,3),(1068144423730,3),(1086702972428,3),(1243348674009,3),(1371630786509,3),(1482777770065,3),(1594101252438,3),(1614722330727,3),(1717710774044,3),(1839027869768,3),(1881127834256,3),(1973491547968,3),(2000420993506,3),(2043992044778,3),(2131817135189,3),(2142643996753,3),(2211541851331,3),(2220337543079,3),(2488632831864,3),(2499542436241,3),(2521265573744,3),(2552333894159,3),(2600842376425,3),(2659815355658,3),(2725462611828,3),(2901306596203,3),(2903605387270,3),(3010946729622,3),(3195038341872,3),(3335712831341,3),(3494778006589,3),(3575791217200,3),(3588395189117,3),(3597267500700,3),(3607659624563,3),(3795516570049,3),(3830426786752,3),(3911908668598,3),(3977006383892,3),(4016274139628,3),(4098663822497,3),(4193161668488,3),(4227895536582,3),(4292784529389,3),(4312933459442,3),(4336866893814,3),(4343960113197,3),(4374485286922,3),(4500219445976,3),(4672779915148,3),(4678811458104,3),(4689819486167,3),(4836258219221,3),(4918917787906,3),(4949166314227,3),(4961455996479,3),(4974553108879,3),(4997632859958,3),(5038259801862,3),(5082048982961,3),(5104077854606,3),(5127755986091,3),(5163177414912,3),(5168470429850,3),(5232413581276,3),(5271999448519,3),(5480200575190,3),(5674369970944,3),(5813955804959,3),(5861857757473,3),(5966926862282,3),(5980060843563,3),(6050766805781,3),(6226901139617,3),(6245767553305,3),(6259524766994,3),(6292349758704,3),(6566311405222,3),(6579021594493,3),(6594884395635,3),(6605788896168,3),(6614062493370,3),(6634404113262,3),(6670766051711,3),(6717353723634,3),(6726673748391,3),(6786588656871,3),(6919361871092,3),(6977002653308,3),(6978356067856,3),(7010881751927,3),(7086990192428,3),(7311642785802,3),(7337541363814,3),(7634847557785,3),(7638308611475,3),(7668335185837,3),(7680402504768,3),(7802082892534,3),(7835349236130,3),(7837082361038,3),(7842270430505,3),(7860112018813,3),(7946423819114,3),(7961064327588,3),(7984155848719,3),(8242168637329,3),(8281707159932,3),(8468143436658,3),(8652579115984,3),(8660113506236,3),(8674679114508,3),(8901946881340,3),(8960659778660,3),(9024474228631,3),(9026873526901,3),(9091495406865,3),(9172640882377,3),(9198622466280,3),(9234812241442,3),(9256532501147,3),(9348695371917,3),(9390878250279,3),(9518770996640,3),(9549577451517,3),(9615323037334,3),(9751277315703,3),(9904174315835,3),(9922379365258,3),(9940702602756,3),(9978611442054,3),(9994189144723,3),(1038643428808,4),(1040314516551,4),(1068144423730,4),(1086702972428,4),(1243348674009,4),(1371630786509,4),(1594101252438,4),(1614722330727,4),(1717710774044,4),(1839027869768,4),(1881127834256,4),(1973491547968,4),(2000420993506,4),(2043992044778,4),(2131817135189,4),(2142643996753,4),(2211541851331,4),(2220337543079,4),(2488632831864,4),(2499542436241,4),(2521265573744,4),(2552333894159,4),(2600842376425,4),(2659815355658,4),(2725462611828,4),(2901306596203,4),(2903605387270,4),(3010946729622,4),(3195038341872,4),(3335712831341,4),(3494778006589,4),(3575791217200,4),(3588395189117,4),(3597267500700,4),(3795516570049,4),(3830426786752,4),(3911908668598,4),(3977006383892,4),(4016274139628,4),(4098663822497,4),(4193161668488,4),(4227895536582,4),(4292784529389,4),(4312933459442,4),(4336866893814,4),(4343960113197,4),(4374485286922,4),(4500219445976,4),(4672779915148,4),(4678811458104,4),(4689819486167,4),(4836258219221,4),(4918917787906,4),(4949166314227,4),(4961455996479,4),(4974553108879,4),(4997632859958,4),(5038259801862,4),(5082048982961,4),(5104077854606,4),(5127755986091,4),(5163177414912,4),(5168470429850,4),(5232413581276,4),(5271999448519,4),(5480200575190,4),(5674369970944,4),(5813955804959,4),(5861857757473,4),(6050766805781,4),(6226901139617,4),(6245767553305,4),(6259524766994,4),(6292349758704,4),(6566311405222,4),(6579021594493,4),(6594884395635,4),(6605788896168,4),(6614062493370,4),(6634404113262,4),(6670766051711,4),(6726673748391,4),(6786588656871,4),(6919361871092,4),(6977002653308,4),(6978356067856,4),(7010881751927,4),(7086990192428,4),(7311642785802,4),(7337541363814,4),(7634847557785,4),(7638308611475,4),(7668335185837,4),(7680402504768,4),(7802082892534,4),(7835349236130,4),(7837082361038,4),(7842270430505,4),(7860112018813,4),(7946423819114,4),(7961064327588,4),(7984155848719,4),(8242168637329,4),(8281707159932,4),(8468143436658,4),(8652579115984,4),(8660113506236,4),(8674679114508,4),(8901946881340,4),(8960659778660,4),(9024474228631,4),(9091495406865,4),(9172640882377,4),(9198622466280,4),(9256532501147,4),(9348695371917,4),(9390878250279,4),(9518770996640,4),(9549577451517,4),(9615323037334,4),(9751277315703,4),(9904174315835,4),(9922379365258,4),(9940702602756,4),(9978611442054,4),(9994189144723,4),(1482777770065,5),(3607659624563,5),(5966926862282,5),(5980060843563,5),(6717353723634,5),(9026873526901,5),(9234812241442,5);
/*!40000 ALTER TABLE `shipmentd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipmenth`
--

DROP TABLE IF EXISTS `shipmenth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shipmenth` (
  `ID` bigint(20) NOT NULL,
  `SellerID` bigint(20) NOT NULL,
  `BuyerID` bigint(20) NOT NULL,
  `FromFacilityID` bigint(20) DEFAULT NULL,
  `ToFacilityID` bigint(20) DEFAULT NULL,
  `CreateDate` datetime(3) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_ShipmentH_Bayer` (`BuyerID`),
  KEY `FK_ShipmentH_Seller` (`SellerID`),
  KEY `FK_ShipmentH_Facility` (`FromFacilityID`),
  KEY `FK_ShipmentH_Facility1` (`ToFacilityID`),
  CONSTRAINT `FK_ShipmentH_Bayer` FOREIGN KEY (`BuyerID`) REFERENCES `buyer` (`ID`),
  CONSTRAINT `FK_ShipmentH_Facility` FOREIGN KEY (`FromFacilityID`) REFERENCES `facility` (`ID`),
  CONSTRAINT `FK_ShipmentH_Facility1` FOREIGN KEY (`ToFacilityID`) REFERENCES `facility` (`ID`),
  CONSTRAINT `FK_ShipmentH_Seller` FOREIGN KEY (`SellerID`) REFERENCES `seller` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipmenth`
--

LOCK TABLES `shipmenth` WRITE;
/*!40000 ALTER TABLE `shipmenth` DISABLE KEYS */;
INSERT INTO `shipmenth` VALUES (1038643428808,2,2,2,1,'2018-01-02 12:13:00.000'),(1040314516551,2,2,2,1,'2018-01-02 12:13:00.000'),(1068144423730,2,2,2,1,'2018-01-02 12:13:00.000'),(1086702972428,2,2,2,1,'2018-01-02 12:13:00.000'),(1243348674009,2,2,2,1,'2018-01-02 12:13:00.000'),(1371630786509,2,2,2,1,'2018-01-02 12:13:00.000'),(1482777770065,1,1,1,2,'2018-01-02 12:13:00.000'),(1594101252438,2,2,2,1,'2018-01-02 12:13:00.000'),(1614722330727,2,2,2,1,'2018-01-02 12:13:00.000'),(1717710774044,2,2,2,1,'2018-01-02 12:13:00.000'),(1839027869768,2,2,2,1,'2018-01-02 12:13:00.000'),(1881127834256,2,2,2,1,'2018-01-02 12:13:00.000'),(1973491547968,2,2,2,1,'2018-01-02 12:13:00.000'),(2000420993506,2,2,2,1,'2018-01-02 12:13:00.000'),(2043992044778,2,2,2,1,'2018-01-02 12:13:00.000'),(2131817135189,2,2,2,1,'2018-01-02 12:13:00.000'),(2142643996753,2,2,2,1,'2018-01-02 12:13:00.000'),(2211541851331,2,2,2,1,'2018-01-02 12:13:00.000'),(2220337543079,2,2,2,1,'2018-01-02 12:13:00.000'),(2488632831864,2,2,2,1,'2018-01-02 12:13:00.000'),(2499542436241,2,2,2,1,'2018-01-02 12:13:00.000'),(2521265573744,2,2,2,1,'2018-01-02 12:13:00.000'),(2552333894159,2,2,2,1,'2018-01-02 12:13:00.000'),(2600842376425,2,2,2,1,'2018-01-02 12:13:00.000'),(2659815355658,2,2,2,1,'2018-01-02 12:13:00.000'),(2725462611828,2,2,2,1,'2018-01-02 12:13:00.000'),(2901306596203,2,2,2,1,'2018-01-02 12:13:00.000'),(2903605387270,2,2,2,1,'2018-01-02 12:13:00.000'),(3010946729622,2,2,2,1,'2018-01-02 12:13:00.000'),(3195038341872,2,2,2,1,'2018-01-02 12:13:00.000'),(3335712831341,2,2,2,1,'2018-01-02 12:13:00.000'),(3494778006589,2,2,2,1,'2018-01-02 12:13:00.000'),(3575791217200,2,2,2,1,'2018-01-02 12:13:00.000'),(3588395189117,2,2,2,1,'2018-01-02 12:13:00.000'),(3597267500700,2,2,2,1,'2018-01-02 12:13:00.000'),(3607659624563,1,1,1,2,'2018-01-02 12:13:00.000'),(3795516570049,2,2,2,1,'2018-01-02 12:13:00.000'),(3830426786752,2,2,2,1,'2018-01-02 12:13:00.000'),(3911908668598,2,2,2,1,'2018-01-02 12:13:00.000'),(3977006383892,2,2,2,1,'2018-01-02 12:13:00.000'),(4016274139628,2,2,2,1,'2018-01-02 12:13:00.000'),(4098663822497,2,2,2,1,'2018-01-02 12:13:00.000'),(4193161668488,2,2,2,1,'2018-01-02 12:13:00.000'),(4227895536582,2,2,2,1,'2018-01-02 12:13:00.000'),(4292784529389,2,2,2,1,'2018-01-02 12:13:00.000'),(4312933459442,2,2,2,1,'2018-01-02 12:13:00.000'),(4336866893814,2,2,2,1,'2018-01-02 12:13:00.000'),(4343960113197,2,2,2,1,'2018-01-02 12:13:00.000'),(4374485286922,2,2,2,1,'2018-01-02 12:13:00.000'),(4500219445976,2,2,2,1,'2018-01-02 12:13:00.000'),(4672779915148,2,2,2,1,'2018-01-02 12:13:00.000'),(4678811458104,2,2,2,1,'2018-01-02 12:13:00.000'),(4689819486167,2,2,2,1,'2018-01-02 12:13:00.000'),(4836258219221,2,2,2,1,'2018-01-02 12:13:00.000'),(4918917787906,2,2,2,1,'2018-01-02 12:13:00.000'),(4949166314227,2,2,2,1,'2018-01-02 12:13:00.000'),(4961455996479,2,2,2,1,'2018-01-02 12:13:00.000'),(4974553108879,2,2,2,1,'2018-01-02 12:13:00.000'),(4997632859958,2,2,2,1,'2018-01-02 12:13:00.000'),(5038259801862,2,2,2,1,'2018-01-02 12:13:00.000'),(5082048982961,2,2,2,1,'2018-01-02 12:13:00.000'),(5104077854606,2,2,2,1,'2018-01-02 12:13:00.000'),(5127755986091,2,2,2,1,'2018-01-02 12:13:00.000'),(5163177414912,2,2,2,1,'2018-01-02 12:13:00.000'),(5168470429850,2,2,2,1,'2018-01-02 12:13:00.000'),(5232413581276,2,2,2,1,'2018-01-02 12:13:00.000'),(5271999448519,2,2,2,1,'2018-01-02 12:13:00.000'),(5480200575190,2,2,2,1,'2018-01-02 12:13:00.000'),(5674369970944,2,2,2,1,'2018-01-02 12:13:00.000'),(5813955804959,2,2,2,1,'2018-01-02 12:13:00.000'),(5861857757473,2,2,2,1,'2018-01-02 12:13:00.000'),(5966926862282,1,1,1,2,'2018-01-02 12:13:00.000'),(5980060843563,1,1,1,2,'2018-01-02 12:13:00.000'),(6050766805781,2,2,2,1,'2018-01-02 12:13:00.000'),(6226901139617,2,2,2,1,'2018-01-02 12:13:00.000'),(6245767553305,2,2,2,1,'2018-01-02 12:13:00.000'),(6259524766994,2,2,2,1,'2018-01-02 12:13:00.000'),(6292349758704,2,2,2,1,'2018-01-02 12:13:00.000'),(6566311405222,2,2,2,1,'2018-01-02 12:13:00.000'),(6579021594493,2,2,2,1,'2018-01-02 12:13:00.000'),(6594884395635,2,2,2,1,'2018-01-02 12:13:00.000'),(6605788896168,2,2,2,1,'2018-01-02 12:13:00.000'),(6614062493370,2,2,2,1,'2018-01-02 12:13:00.000'),(6634404113262,2,2,2,1,'2018-01-02 12:13:00.000'),(6670766051711,2,2,2,1,'2018-01-02 12:13:00.000'),(6717353723634,1,1,1,2,'2018-01-02 12:13:00.000'),(6726673748391,2,2,2,1,'2018-01-02 12:13:00.000'),(6786588656871,2,2,2,1,'2018-01-02 12:13:00.000'),(6919361871092,2,2,2,1,'2018-01-02 12:13:00.000'),(6977002653308,2,2,2,1,'2018-01-02 12:13:00.000'),(6978356067856,2,2,2,1,'2018-01-02 12:13:00.000'),(7010881751927,2,2,2,1,'2018-01-02 12:13:00.000'),(7086990192428,2,2,2,1,'2018-01-02 12:13:00.000'),(7311642785802,2,2,2,1,'2018-01-02 12:13:00.000'),(7337541363814,2,2,2,1,'2018-01-02 12:13:00.000'),(7634847557785,2,2,2,1,'2018-01-02 12:13:00.000'),(7638308611475,2,2,2,1,'2018-01-02 12:13:00.000'),(7668335185837,2,2,2,1,'2018-01-02 12:13:00.000'),(7680402504768,2,2,2,1,'2018-01-02 12:13:00.000'),(7802082892534,2,2,2,1,'2018-01-02 12:13:00.000'),(7835349236130,2,2,2,1,'2018-01-02 12:13:00.000'),(7837082361038,2,2,2,1,'2018-01-02 12:13:00.000'),(7842270430505,2,2,2,1,'2018-01-02 12:13:00.000'),(7860112018813,2,2,2,1,'2018-01-02 12:13:00.000'),(7946423819114,2,2,2,1,'2018-01-02 12:13:00.000'),(7961064327588,2,2,2,1,'2018-01-02 12:13:00.000'),(7984155848719,2,2,2,1,'2018-01-02 12:13:00.000'),(8242168637329,2,2,2,1,'2018-01-02 12:13:00.000'),(8281707159932,2,2,2,1,'2018-01-02 12:13:00.000'),(8468143436658,2,2,2,1,'2018-01-02 12:13:00.000'),(8652579115984,2,2,2,1,'2018-01-02 12:13:00.000'),(8660113506236,2,2,2,1,'2018-01-02 12:13:00.000'),(8674679114508,2,2,2,1,'2018-01-02 12:13:00.000'),(8901946881340,2,2,2,1,'2018-01-02 12:13:00.000'),(8960659778660,2,2,2,1,'2018-01-02 12:13:00.000'),(9024474228631,2,2,2,1,'2018-01-02 12:13:00.000'),(9026873526901,1,1,1,2,'2018-01-02 12:13:00.000'),(9091495406865,2,2,2,1,'2018-01-02 12:13:00.000'),(9172640882377,2,2,2,1,'2018-01-02 12:13:00.000'),(9198622466280,2,2,2,1,'2018-01-02 12:13:00.000'),(9234812241442,1,1,1,2,'2018-01-02 12:13:00.000'),(9256532501147,2,2,2,1,'2018-01-02 12:13:00.000'),(9348695371917,2,2,2,1,'2018-01-02 12:13:00.000'),(9390878250279,2,2,2,1,'2018-01-02 12:13:00.000'),(9518770996640,2,2,2,1,'2018-01-02 12:13:00.000'),(9549577451517,2,2,2,1,'2018-01-02 12:13:00.000'),(9615323037334,2,2,2,1,'2018-01-02 12:13:00.000'),(9751277315703,2,2,2,1,'2018-01-02 12:13:00.000'),(9904174315835,2,2,2,1,'2018-01-02 12:13:00.000'),(9922379365258,2,2,2,1,'2018-01-02 12:13:00.000'),(9940702602756,2,2,2,1,'2018-01-02 12:13:00.000'),(9978611442054,2,2,2,1,'2018-01-02 12:13:00.000'),(9994189144723,2,3,2,1,'2018-01-02 12:13:00.000');
/*!40000 ALTER TABLE `shipmenth` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-01-24 21:30:52
