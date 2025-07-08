-- MySQL dump 10.13  Distrib 8.0.42, for Linux (x86_64)
--
-- Host: localhost    Database: resto
-- ------------------------------------------------------
-- Server version	8.0.42-0ubuntu0.24.04.1

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
-- Current Database: `resto`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `resto` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `resto`;

--
-- Table structure for table `Client`
--

DROP TABLE IF EXISTS `Client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Client` (
  `ID_client` int NOT NULL AUTO_INCREMENT,
  `Nom` varchar(100) DEFAULT NULL,
  `Prenom` varchar(100) DEFAULT NULL,
  `Telephone` varchar(20) DEFAULT NULL,
  `Adresse` varchar(255) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID_client`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Client`
--

LOCK TABLES `Client` WRITE;
/*!40000 ALTER TABLE `Client` DISABLE KEYS */;
INSERT INTO `Client` VALUES (1,'Abdallah','Issa','66223344','Avenue N’Djamena, Abéché','abdallah.issa@email.td'),(2,'Ali','Fatimé','66334455','Rue du Marché, Abéché','fatime.ali@email.td');
/*!40000 ALTER TABLE `Client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Commande`
--

DROP TABLE IF EXISTS `Commande`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Commande` (
  `ID_commande` int NOT NULL AUTO_INCREMENT,
  `Date` date DEFAULT NULL,
  `Heure` time DEFAULT NULL,
  `Montant_total` decimal(10,2) DEFAULT NULL,
  `Nom` varchar(100) DEFAULT NULL,
  `Type` varchar(50) DEFAULT NULL,
  `Statu` varchar(50) DEFAULT NULL,
  `ID_client` int DEFAULT NULL,
  PRIMARY KEY (`ID_commande`),
  KEY `ID_client` (`ID_client`),
  CONSTRAINT `Commande_ibfk_1` FOREIGN KEY (`ID_client`) REFERENCES `Client` (`ID_client`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Commande`
--

LOCK TABLES `Commande` WRITE;
/*!40000 ALTER TABLE `Commande` DISABLE KEYS */;
INSERT INTO `Commande` VALUES (1,'2025-06-02','13:30:00',8000.00,'Commande Midi','sur place','en cours',1),(2,'2025-06-02','19:15:00',12000.00,'Commande Soir','emporté','terminée',2);
/*!40000 ALTER TABLE `Commande` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Employe`
--

DROP TABLE IF EXISTS `Employe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Employe` (
  `ID_employe` int NOT NULL AUTO_INCREMENT,
  `Nom` varchar(100) DEFAULT NULL,
  `Prenom` varchar(100) DEFAULT NULL,
  `Poste` varchar(50) DEFAULT NULL,
  `Salaire` decimal(10,2) DEFAULT NULL,
  `date_amboche` date DEFAULT NULL,
  PRIMARY KEY (`ID_employe`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Employe`
--

LOCK TABLES `Employe` WRITE;
/*!40000 ALTER TABLE `Employe` DISABLE KEYS */;
INSERT INTO `Employe` VALUES (1,'Mahamat','Youssouf','Serveur',150000.00,'2023-02-10'),(2,'Zakaria','Oumar','Cuisinier',180000.00,'2022-11-01');
/*!40000 ALTER TABLE `Employe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Facture`
--

DROP TABLE IF EXISTS `Facture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Facture` (
  `ID_facture` int NOT NULL AUTO_INCREMENT,
  `Date` date DEFAULT NULL,
  `Montant` decimal(10,2) DEFAULT NULL,
  `detail_plant` text,
  `mode_paiement` varchar(50) DEFAULT NULL,
  `ID_commande` int DEFAULT NULL,
  PRIMARY KEY (`ID_facture`),
  KEY `ID_commande` (`ID_commande`),
  CONSTRAINT `Facture_ibfk_1` FOREIGN KEY (`ID_commande`) REFERENCES `Commande` (`ID_commande`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Facture`
--

LOCK TABLES `Facture` WRITE;
/*!40000 ALTER TABLE `Facture` DISABLE KEYS */;
INSERT INTO `Facture` VALUES (1,'2025-06-02',8000.00,'2 plats + 2 jus','Espèce',1),(2,'2025-06-02',12000.00,'3 plats','Mobile Money',2);
/*!40000 ALTER TABLE `Facture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Fournisseur`
--

DROP TABLE IF EXISTS `Fournisseur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Fournisseur` (
  `ID_fournisseur` int NOT NULL AUTO_INCREMENT,
  `Nom` varchar(100) DEFAULT NULL,
  `Specialite` varchar(100) DEFAULT NULL,
  `Contact` varchar(100) DEFAULT NULL,
  `condition_paiement` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID_fournisseur`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Fournisseur`
--

LOCK TABLES `Fournisseur` WRITE;
/*!40000 ALTER TABLE `Fournisseur` DISABLE KEYS */;
INSERT INTO `Fournisseur` VALUES (1,'Fournichad','Produits carnés','66445566','30 jours'),(2,'AgroLocal','Légumes secs','66221133','Paiement comptant');
/*!40000 ALTER TABLE `Fournisseur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Ingredient`
--

DROP TABLE IF EXISTS `Ingredient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Ingredient` (
  `ID_ingredient` int NOT NULL AUTO_INCREMENT,
  `Nom` varchar(100) DEFAULT NULL,
  `Quantite` varchar(50) DEFAULT NULL,
  `Prix` decimal(10,2) DEFAULT NULL,
  `Description` text,
  PRIMARY KEY (`ID_ingredient`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Ingredient`
--

LOCK TABLES `Ingredient` WRITE;
/*!40000 ALTER TABLE `Ingredient` DISABLE KEYS */;
INSERT INTO `Ingredient` VALUES (1,'Poulet','1 kg',3000.00,'Poulet entier prêt à cuire'),(2,'Arachide','500 g',1500.00,'Graines d’arachide séchées');
/*!40000 ALTER TABLE `Ingredient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Plat`
--

DROP TABLE IF EXISTS `Plat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Plat` (
  `ID_plat` int NOT NULL AUTO_INCREMENT,
  `Nom` varchar(100) DEFAULT NULL,
  `Description` text,
  `Prix` decimal(10,2) DEFAULT NULL,
  `code_plat` varchar(50) DEFAULT NULL,
  `categorie` varchar(50) DEFAULT NULL,
  `temp_preparation` time DEFAULT NULL,
  `liste_des_ingredients` text,
  PRIMARY KEY (`ID_plat`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Plat`
--

LOCK TABLES `Plat` WRITE;
/*!40000 ALTER TABLE `Plat` DISABLE KEYS */;
INSERT INTO `Plat` VALUES (1,'Poulet DG','Plat africain populaire avec banane plantain',4500.00,'PL001','Principal','00:25:00','Poulet, banane, légumes'),(2,'Riz sauce arachide','Riz blanc accompagné de sauce aux arachides',3500.00,'PL002','Principal','00:20:00','Riz, arachide, huile');
/*!40000 ALTER TABLE `Plat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Table_restaurant`
--

DROP TABLE IF EXISTS `Table_restaurant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Table_restaurant` (
  `ID_table` int NOT NULL AUTO_INCREMENT,
  `Nom` varchar(100) DEFAULT NULL,
  `Capacite` int DEFAULT NULL,
  `zone_emplacement` varchar(100) DEFAULT NULL,
  `Numero` int DEFAULT NULL,
  `etat` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID_table`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Table_restaurant`
--

LOCK TABLES `Table_restaurant` WRITE;
/*!40000 ALTER TABLE `Table_restaurant` DISABLE KEYS */;
INSERT INTO `Table_restaurant` VALUES (1,'Table A',4,'Zone intérieure',1,'libre'),(2,'Table B',2,'Terrasse',2,'occupée');
/*!40000 ALTER TABLE `Table_restaurant` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-08 12:51:25
