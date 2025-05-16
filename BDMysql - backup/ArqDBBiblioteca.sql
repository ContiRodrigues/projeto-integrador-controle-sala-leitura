-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: db_biblioteca
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `aluno`
--

DROP TABLE IF EXISTS `aluno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aluno` (
  `ra` int NOT NULL,
  `nome` varchar(45) COLLATE utf8mb3_bin NOT NULL,
  `email` varchar(45) COLLATE utf8mb3_bin DEFAULT NULL,
  `telefone` varchar(12) COLLATE utf8mb3_bin DEFAULT NULL,
  `senha` varchar(45) COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`ra`),
  UNIQUE KEY `ra_UNIQUE` (`ra`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aluno`
--

LOCK TABLES `aluno` WRITE;
/*!40000 ALTER TABLE `aluno` DISABLE KEYS */;
INSERT INTO `aluno` VALUES (2,'Mario','jose@gmail.com','19988888888','123abc'),(3,'Maria','maria@gmail.com','19977777777','123abc');
/*!40000 ALTER TABLE `aluno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bibliotecario`
--

DROP TABLE IF EXISTS `bibliotecario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bibliotecario` (
  `id_bibliotecario` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) COLLATE utf8mb3_bin DEFAULT NULL,
  `login` varchar(100) COLLATE utf8mb3_bin NOT NULL,
  `senha` varchar(100) COLLATE utf8mb3_bin NOT NULL,
  `email` varchar(100) COLLATE utf8mb3_bin NOT NULL,
  `matricula` int NOT NULL,
  PRIMARY KEY (`id_bibliotecario`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bibliotecario`
--

LOCK TABLES `bibliotecario` WRITE;
/*!40000 ALTER TABLE `bibliotecario` DISABLE KEYS */;
INSERT INTO `bibliotecario` VALUES (1,'Maria','mr','mr123','maria@bol.com.br',1),(3,'Carla','cr','cr123','carla@uol.com.br',2);
/*!40000 ALTER TABLE `bibliotecario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disponibilidade`
--

DROP TABLE IF EXISTS `disponibilidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `disponibilidade` (
  `id_disponibilidade` int NOT NULL AUTO_INCREMENT,
  `id_exemplar` int NOT NULL,
  `id_emprestimo` int NOT NULL,
  PRIMARY KEY (`id_disponibilidade`),
  KEY `fk_disponibilidade_exemplar` (`id_exemplar`),
  KEY `fk_disponibilidade_emprestimo` (`id_emprestimo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disponibilidade`
--

LOCK TABLES `disponibilidade` WRITE;
/*!40000 ALTER TABLE `disponibilidade` DISABLE KEYS */;
INSERT INTO `disponibilidade` VALUES (1,1,1),(2,1,2);
/*!40000 ALTER TABLE `disponibilidade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emprestimo`
--

DROP TABLE IF EXISTS `emprestimo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emprestimo` (
  `id_emprestimo` int NOT NULL AUTO_INCREMENT,
  `data_emprestimo` date NOT NULL,
  `previsao_entrega` date NOT NULL,
  `data_entrega` date NOT NULL,
  `ra` int NOT NULL,
  `id_exemplar` int NOT NULL,
  PRIMARY KEY (`id_emprestimo`),
  KEY `fk_emprestimo_aluno` (`ra`),
  KEY `fk_emprestimo_exemplar` (`id_exemplar`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emprestimo`
--

LOCK TABLES `emprestimo` WRITE;
/*!40000 ALTER TABLE `emprestimo` DISABLE KEYS */;
INSERT INTO `emprestimo` VALUES (1,'2024-05-04','2024-05-10','2024-05-10',2,1),(2,'2024-05-04','2024-05-10','2024-05-10',3,2);
/*!40000 ALTER TABLE `emprestimo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exemplar`
--

DROP TABLE IF EXISTS `exemplar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exemplar` (
  `id_exemplar` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) COLLATE utf8mb3_bin NOT NULL,
  `editora` varchar(200) COLLATE utf8mb3_bin NOT NULL,
  `autor` varchar(150) COLLATE utf8mb3_bin NOT NULL,
  `genero` varchar(50) COLLATE utf8mb3_bin NOT NULL,
  `publicacao` date DEFAULT NULL,
  `quantidade` int DEFAULT NULL,
  PRIMARY KEY (`id_exemplar`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exemplar`
--

LOCK TABLES `exemplar` WRITE;
/*!40000 ALTER TABLE `exemplar` DISABLE KEYS */;
INSERT INTO `exemplar` VALUES (1,'Memorias postumas de brsa cubas','Best Seller','Machado de Assis','ficçao','1942-05-10',3),(2,'Calculo','Sextante','Hoffmann','didático','1999-12-21',2);
/*!40000 ALTER TABLE `exemplar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prateleira`
--

DROP TABLE IF EXISTS `prateleira`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prateleira` (
  `id_prateleira` int NOT NULL,
  `id_exemplar` int NOT NULL,
  `linha` int DEFAULT NULL,
  `coluna` int DEFAULT NULL,
  PRIMARY KEY (`id_exemplar`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prateleira`
--

LOCK TABLES `prateleira` WRITE;
/*!40000 ALTER TABLE `prateleira` DISABLE KEYS */;
INSERT INTO `prateleira` VALUES (1,1,1,1),(1,2,1,3);
/*!40000 ALTER TABLE `prateleira` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'db_biblioteca'
--

--
-- Dumping routines for database 'db_biblioteca'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-05 16:07:34
