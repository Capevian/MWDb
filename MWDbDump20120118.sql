-- MySQL dump 10.13  Distrib 5.5.16, for Win32 (x86)
--
-- Host: localhost    Database: mwdb
-- ------------------------------------------------------
-- Server version	5.5.17

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
-- Current Database: `mwdb`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `mwdb` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `mwdb`;

--
-- Table structure for table `avaliacao`
--

DROP TABLE IF EXISTS `avaliacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `avaliacao` (
  `user_oid` int(11) NOT NULL,
  `mini_oid` int(11) NOT NULL,
  `avaliacao` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_oid`,`mini_oid`),
  KEY `fk_avaliacao_user` (`user_oid`),
  KEY `fk_avaliacao_miniatura` (`mini_oid`),
  CONSTRAINT `fk_avaliacao_miniatura` FOREIGN KEY (`mini_oid`) REFERENCES `miniatura` (`oid_mini`),
  CONSTRAINT `fk_avaliacao_user` FOREIGN KEY (`user_oid`) REFERENCES `user` (`oid_user`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avaliacao`
--

LOCK TABLES `avaliacao` WRITE;
/*!40000 ALTER TABLE `avaliacao` DISABLE KEYS */;
INSERT INTO `avaliacao` VALUES (1,4,5),(2,3,5),(4,3,4);
/*!40000 ALTER TABLE `avaliacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comentario`
--

DROP TABLE IF EXISTS `comentario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comentario` (
  `oid` int(11) NOT NULL,
  `timestamp` datetime DEFAULT NULL,
  `texto` varchar(255) DEFAULT NULL,
  `miniatura_oid_mini` int(11) DEFAULT NULL,
  `user_oid_user` int(11) DEFAULT NULL,
  `publicado` bit(1) DEFAULT NULL,
  PRIMARY KEY (`oid`),
  KEY `fk_comentario_miniatura` (`miniatura_oid_mini`),
  KEY `fk_comentario_user` (`user_oid_user`),
  CONSTRAINT `fk_comentario_miniatura` FOREIGN KEY (`miniatura_oid_mini`) REFERENCES `miniatura` (`oid_mini`),
  CONSTRAINT `fk_comentario_user` FOREIGN KEY (`user_oid_user`) REFERENCES `user` (`oid_user`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comentario`
--

LOCK TABLES `comentario` WRITE;
/*!40000 ALTER TABLE `comentario` DISABLE KEYS */;
INSERT INTO `comentario` VALUES (1,NULL,'Grande Miniatura!',4,1,NULL),(2,NULL,'Boa miniatura. Grande detalhe.',3,4,NULL),(3,NULL,'Tenho esta miniatura! Está um espectáculo.',3,2,NULL);
/*!40000 ALTER TABLE `comentario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `construtor`
--

DROP TABLE IF EXISTS `construtor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `construtor` (
  `oid` int(11) NOT NULL,
  `nomeconstrutor` varchar(255) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `construtor`
--

LOCK TABLES `construtor` WRITE;
/*!40000 ALTER TABLE `construtor` DISABLE KEYS */;
INSERT INTO `construtor` VALUES (3,'Bburago','upload/ent6/1/bburago.jpg','www.bburago.com/'),(5,'NOREV','upload/ent6/1/Norev.jpg','http://www.norev.com/index.php?lang=en'),(7,'Century Wings','upload/ent6/1/Century.jpg','http://www.centurywings.com/');
/*!40000 ALTER TABLE `construtor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `escala`
--

DROP TABLE IF EXISTS `escala`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `escala` (
  `oid` int(11) NOT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `escala`
--

LOCK TABLES `escala` WRITE;
/*!40000 ALTER TABLE `escala` DISABLE KEYS */;
INSERT INTO `escala` VALUES (1,'1/18'),(2,'1/24'),(3,'1/43'),(4,'1/72'),(5,'1/144');
/*!40000 ALTER TABLE `escala` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fotos_miniatura`
--

DROP TABLE IF EXISTS `fotos_miniatura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fotos_miniatura` (
  `oid` int(11) NOT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `miniatura_oid_mini` int(11) DEFAULT NULL,
  PRIMARY KEY (`oid`),
  KEY `fk_fotos_miniatura_miniatura` (`miniatura_oid_mini`),
  CONSTRAINT `fk_fotos_miniatura_miniatura` FOREIGN KEY (`miniatura_oid_mini`) REFERENCES `miniatura` (`oid_mini`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fotos_miniatura`
--

LOCK TABLES `fotos_miniatura` WRITE;
/*!40000 ALTER TABLE `fotos_miniatura` DISABLE KEYS */;
/*!40000 ALTER TABLE `fotos_miniatura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fotos_modelo`
--

DROP TABLE IF EXISTS `fotos_modelo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fotos_modelo` (
  `oid` int(11) NOT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `modelo_oid` int(11) DEFAULT NULL,
  PRIMARY KEY (`oid`),
  KEY `fk_fotos_modelo_modelo` (`modelo_oid`),
  CONSTRAINT `fk_fotos_modelo_modelo` FOREIGN KEY (`modelo_oid`) REFERENCES `modelo` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fotos_modelo`
--

LOCK TABLES `fotos_modelo` WRITE;
/*!40000 ALTER TABLE `fotos_modelo` DISABLE KEYS */;
/*!40000 ALTER TABLE `fotos_modelo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group`
--

DROP TABLE IF EXISTS `group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group` (
  `oid` int(11) NOT NULL,
  `groupname` varchar(255) DEFAULT NULL,
  `module_oid` int(11) DEFAULT NULL,
  PRIMARY KEY (`oid`),
  KEY `fk_group_module` (`module_oid`),
  CONSTRAINT `fk_group_module` FOREIGN KEY (`module_oid`) REFERENCES `module` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group`
--

LOCK TABLES `group` WRITE;
/*!40000 ALTER TABLE `group` DISABLE KEYS */;
INSERT INTO `group` VALUES (0,'NonRegistered',2),(1,'Users',1);
/*!40000 ALTER TABLE `group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_module`
--

DROP TABLE IF EXISTS `group_module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_module` (
  `group_oid` int(11) NOT NULL,
  `module_oid` int(11) NOT NULL,
  PRIMARY KEY (`group_oid`,`module_oid`),
  KEY `fk_group_module_group` (`group_oid`),
  KEY `fk_group_module_module` (`module_oid`),
  CONSTRAINT `fk_group_module_group` FOREIGN KEY (`group_oid`) REFERENCES `group` (`oid`),
  CONSTRAINT `fk_group_module_module` FOREIGN KEY (`module_oid`) REFERENCES `module` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_module`
--

LOCK TABLES `group_module` WRITE;
/*!40000 ALTER TABLE `group_module` DISABLE KEYS */;
INSERT INTO `group_module` VALUES (0,4),(1,3);
/*!40000 ALTER TABLE `group_module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marca`
--

DROP TABLE IF EXISTS `marca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `marca` (
  `oid` int(11) NOT NULL,
  `nomemarca` varchar(255) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `tipo_oid` int(11) DEFAULT NULL,
  PRIMARY KEY (`oid`),
  KEY `fk_marca_tipo` (`tipo_oid`),
  CONSTRAINT `fk_marca_tipo` FOREIGN KEY (`tipo_oid`) REFERENCES `tipo` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marca`
--

LOCK TABLES `marca` WRITE;
/*!40000 ALTER TABLE `marca` DISABLE KEYS */;
INSERT INTO `marca` VALUES (1,'Ferrari','upload/ent1/3/ferrari-logo.png',1),(5,'Porsche','upload/ent1/2/porsche.jpg',1),(6,'Alfa Romeo','upload/ent1/1/logo_alfaromeo.jpg',1),(7,'Grumman','upload/ent1/1/grumman.jpg',2);
/*!40000 ALTER TABLE `marca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `miniatura`
--

DROP TABLE IF EXISTS `miniatura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `miniatura` (
  `oid_mini` int(11) NOT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `modelo_oid` int(11) DEFAULT NULL,
  `escala_oid` int(11) DEFAULT NULL,
  `construtor_oid` int(11) DEFAULT NULL,
  `thumb` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`oid_mini`),
  KEY `fk_miniatura_modelo` (`modelo_oid`),
  KEY `fk_miniatura_escala` (`escala_oid`),
  KEY `fk_miniatura_construtor` (`construtor_oid`),
  CONSTRAINT `fk_miniatura_construtor` FOREIGN KEY (`construtor_oid`) REFERENCES `construtor` (`oid`),
  CONSTRAINT `fk_miniatura_escala` FOREIGN KEY (`escala_oid`) REFERENCES `escala` (`oid`),
  CONSTRAINT `fk_miniatura_modelo` FOREIGN KEY (`modelo_oid`) REFERENCES `modelo` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `miniatura`
--

LOCK TABLES `miniatura` WRITE;
/*!40000 ALTER TABLE `miniatura` DISABLE KEYS */;
INSERT INTO `miniatura` VALUES (1,'',7,1,3,'upload/ent3/2/8c.jpg'),(2,'',1,1,3,'upload/ent3/1/f50.jpg'),(3,'',8,4,7,'upload/ent3/1/f14.jpg'),(4,'',4,1,5,'upload/ent3/1/NR930Turbo.jpg');
/*!40000 ALTER TABLE `miniatura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modelo`
--

DROP TABLE IF EXISTS `modelo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modelo` (
  `oid` int(11) NOT NULL,
  `nomemodelo` varchar(255) DEFAULT NULL,
  `anolancamento` datetime DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `marca_oid` int(11) DEFAULT NULL,
  `thumb` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`oid`),
  KEY `fk_modelo_marca` (`marca_oid`),
  CONSTRAINT `fk_modelo_marca` FOREIGN KEY (`marca_oid`) REFERENCES `marca` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modelo`
--

LOCK TABLES `modelo` WRITE;
/*!40000 ALTER TABLE `modelo` DISABLE KEYS */;
INSERT INTO `modelo` VALUES (1,'F50','1995-01-18 00:00:00','http://en.wikipedia.org/wiki/Ferrari_F50',1,'upload/ent2/1/ff50.jpg'),(4,'Porsche 911 Turbo 3.3L (930)','1985-01-18 00:00:00','http://en.wikipedia.org/wiki/Porsche_930',5,'upload/ent2/2/930Turbo.jpg'),(7,'8C Competizione','2007-01-26 00:00:00','http://en.wikipedia.org/wiki/Alfa_Romeo_8C_Competizione',6,'upload/ent2/2/alfa8c.jpg'),(8,'F4','2003-04-24 00:00:00','http://en.wikipedia.org/wiki/Grumman_F-14_Tomcat',7,'upload/ent2/1/f4.jpg');
/*!40000 ALTER TABLE `modelo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `module`
--

DROP TABLE IF EXISTS `module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `module` (
  `oid` int(11) NOT NULL,
  `moduleid` varchar(255) DEFAULT NULL,
  `modulename` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `module`
--

LOCK TABLES `module` WRITE;
/*!40000 ALTER TABLE `module` DISABLE KEYS */;
INSERT INTO `module` VALUES (1,'page1','Home'),(2,'page22','Login Page'),(3,'lou1','Logout'),(4,'lgu1','Login');
/*!40000 ALTER TABLE `module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo`
--

DROP TABLE IF EXISTS `tipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo` (
  `oid` int(11) NOT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo`
--

LOCK TABLES `tipo` WRITE;
/*!40000 ALTER TABLE `tipo` DISABLE KEYS */;
INSERT INTO `tipo` VALUES (1,'Automóveis'),(2,'Aviões'),(3,'Motas');
/*!40000 ALTER TABLE `tipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `oid_user` int(11) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `group_oid` int(11) DEFAULT NULL,
  PRIMARY KEY (`oid_user`),
  KEY `fk_user_group` (`group_oid`),
  CONSTRAINT `fk_user_group` FOREIGN KEY (`group_oid`) REFERENCES `group` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'andre','andre','andre@andre.pt',1),(2,'carlos','carlos','carlos@carlos.pt',1),(3,'vitor','vitor','vitor@vitor.pt',1),(4,'user','user','user@user.pt',1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_group`
--

DROP TABLE IF EXISTS `user_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_group` (
  `user_oid_user` int(11) NOT NULL,
  `group_oid` int(11) NOT NULL,
  PRIMARY KEY (`user_oid_user`,`group_oid`),
  KEY `fk_user_group_user` (`user_oid_user`),
  KEY `fk_user_group_group` (`group_oid`),
  CONSTRAINT `fk_user_group_group` FOREIGN KEY (`group_oid`) REFERENCES `group` (`oid`),
  CONSTRAINT `fk_user_group_user` FOREIGN KEY (`user_oid_user`) REFERENCES `user` (`oid_user`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_group`
--

LOCK TABLES `user_group` WRITE;
/*!40000 ALTER TABLE `user_group` DISABLE KEYS */;
INSERT INTO `user_group` VALUES (1,1);
/*!40000 ALTER TABLE `user_group` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-01-18 20:44:12
