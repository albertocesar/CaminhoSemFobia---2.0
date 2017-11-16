-- MySQL dump 10.13  Distrib 5.7.18, for Linux (x86_64)
--
-- Host: localhost    Database: caminhosemfobia
-- ------------------------------------------------------
-- Server version	5.7.18-0ubuntu0.16.04.1

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
-- Table structure for table `atendimento`
--

DROP TABLE IF EXISTS `atendimento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `atendimento` (
  `cod_atendimento` decimal(10,0) NOT NULL,
  `relato` varchar(100) DEFAULT NULL,
  `cod_usuario` decimal(10,0) DEFAULT NULL,
  `cod_estabelecimento` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`cod_atendimento`),
  KEY `fk_atendimento_estabelecimento` (`cod_estabelecimento`),
  KEY `fk_atendimento_usuario` (`cod_usuario`),
  CONSTRAINT `fk_atendimento_estabelecimento` FOREIGN KEY (`cod_estabelecimento`) REFERENCES `estabelecimento` (`cod_estabelecimento`),
  CONSTRAINT `fk_atendimento_usuario` FOREIGN KEY (`cod_usuario`) REFERENCES `usuario` (`cod_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `atendimento`
--

LOCK TABLES `atendimento` WRITE;
/*!40000 ALTER TABLE `atendimento` DISABLE KEYS */;
/*!40000 ALTER TABLE `atendimento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `endereco`
--

DROP TABLE IF EXISTS `endereco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `endereco` (
  `nome_rua` varchar(50) DEFAULT NULL,
  `bairro` varchar(50) DEFAULT NULL,
  `cidade` varchar(50) DEFAULT NULL,
  `estado` varchar(50) DEFAULT NULL,
  `cod_endereco` decimal(10,0) NOT NULL,
  `cod_violencia` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`cod_endereco`),
  KEY `pk_endereco_violencia` (`cod_violencia`),
  CONSTRAINT `pk_endereco_violencia` FOREIGN KEY (`cod_violencia`) REFERENCES `violencia` (`cod_violencia`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `endereco`
--

LOCK TABLES `endereco` WRITE;
/*!40000 ALTER TABLE `endereco` DISABLE KEYS */;
/*!40000 ALTER TABLE `endereco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estabelecimento`
--

DROP TABLE IF EXISTS `estabelecimento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estabelecimento` (
  `cod_estabelecimento` decimal(10,0) NOT NULL,
  `nome_estabelecimento` varchar(50) DEFAULT NULL,
  `cod_atendimento` decimal(10,0) DEFAULT NULL,
  `cod_violencia` decimal(10,0) DEFAULT NULL,
  `rua` varchar(100) DEFAULT NULL,
  `numero` decimal(10,0) DEFAULT NULL,
  `estado` varchar(50) DEFAULT NULL,
  `cidade` varchar(100) DEFAULT NULL,
  `cod_endereco` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`cod_estabelecimento`),
  KEY `fk_estabelecimento_atendimento` (`cod_atendimento`),
  KEY `fk_estabelecimento_endereco` (`cod_endereco`),
  KEY `fk_estabelecimento_violencia` (`cod_violencia`),
  CONSTRAINT `fk_estabelecimento_atendimento` FOREIGN KEY (`cod_atendimento`) REFERENCES `atendimento` (`cod_atendimento`),
  CONSTRAINT `fk_estabelecimento_endereco` FOREIGN KEY (`cod_endereco`) REFERENCES `endereco` (`cod_endereco`),
  CONSTRAINT `fk_estabelecimento_violencia` FOREIGN KEY (`cod_violencia`) REFERENCES `violencia` (`cod_violencia`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estabelecimento`
--

LOCK TABLES `estabelecimento` WRITE;
/*!40000 ALTER TABLE `estabelecimento` DISABLE KEYS */;
/*!40000 ALTER TABLE `estabelecimento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `localizacao`
--

DROP TABLE IF EXISTS `localizacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `localizacao` (
  `ns` decimal(10,0) DEFAULT NULL,
  `lat` decimal(10,0) DEFAULT NULL,
  `eo` decimal(10,0) DEFAULT NULL,
  `cod_localizacao` decimal(10,0) NOT NULL,
  `longi` decimal(10,0) DEFAULT NULL,
  `cod_violencia` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`cod_localizacao`),
  KEY `fk_localizacao_violencia` (`cod_violencia`),
  CONSTRAINT `fk_localizacao_violencia` FOREIGN KEY (`cod_violencia`) REFERENCES `violencia` (`cod_violencia`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `localizacao`
--

LOCK TABLES `localizacao` WRITE;
/*!40000 ALTER TABLE `localizacao` DISABLE KEYS */;
/*!40000 ALTER TABLE `localizacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `nome_completo` varchar(100) DEFAULT NULL,
  `senha` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `cod_usuario` decimal(10,0) NOT NULL,
  `cod_atendimento` decimal(10,0) DEFAULT NULL,
  `cod_violencia` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`cod_usuario`),
  KEY `fk_usuario_atendimento` (`cod_atendimento`),
  CONSTRAINT `fk_usuario_atendimento` FOREIGN KEY (`cod_atendimento`) REFERENCES `atendimento` (`cod_atendimento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `violencia`
--

DROP TABLE IF EXISTS `violencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `violencia` (
  `relato` varchar(1000) DEFAULT NULL,
  `cod_violencia` decimal(10,0) NOT NULL,
  `cod_usuario` decimal(10,0) DEFAULT NULL,
  `cod_localizacao` decimal(10,0) DEFAULT NULL,
  `cod_endereco` decimal(10,0) DEFAULT NULL,
  `cod_estabelecimento` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`cod_violencia`),
  KEY `fk_violencia_endereco` (`cod_endereco`),
  KEY `fk_violencia_estabelecimento` (`cod_estabelecimento`),
  KEY `fk_violencia_localizacao` (`cod_localizacao`),
  KEY `fk_violencia_usuario` (`cod_usuario`),
  CONSTRAINT `fk_violencia_endereco` FOREIGN KEY (`cod_endereco`) REFERENCES `endereco` (`cod_endereco`),
  CONSTRAINT `fk_violencia_estabelecimento` FOREIGN KEY (`cod_estabelecimento`) REFERENCES `estabelecimento` (`cod_estabelecimento`),
  CONSTRAINT `fk_violencia_localizacao` FOREIGN KEY (`cod_localizacao`) REFERENCES `localizacao` (`cod_localizacao`),
  CONSTRAINT `fk_violencia_usuario` FOREIGN KEY (`cod_usuario`) REFERENCES `usuario` (`cod_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `violencia`
--

LOCK TABLES `violencia` WRITE;
/*!40000 ALTER TABLE `violencia` DISABLE KEYS */;
/*!40000 ALTER TABLE `violencia` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-08-03  9:28:35
