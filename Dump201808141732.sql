-- MySQL dump 10.13  Distrib 5.7.18, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: db_piramide
-- ------------------------------------------------------
-- Server version	5.7.18-1

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
-- Table structure for table `dbur_agentes`
--

DROP TABLE IF EXISTS `dbur_agentes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dbur_agentes` (
  `id_agente` varchar(20) NOT NULL,
  `nombre_agente` varchar(60) NOT NULL,
  `desc_agente` varchar(100) DEFAULT NULL,
  `id_restaurante` varchar(36) NOT NULL,
  PRIMARY KEY (`id_agente`),
  KEY `fk_dbur_agentes_1_idx` (`id_restaurante`),
  CONSTRAINT `fk_dbur_agentes_1` FOREIGN KEY (`id_restaurante`) REFERENCES `dbur_restaurantes_sucursales` (`id_restaurante`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dbur_agentes`
--

LOCK TABLES `dbur_agentes` WRITE;
/*!40000 ALTER TABLE `dbur_agentes` DISABLE KEYS */;
INSERT INTO `dbur_agentes` VALUES ('ursv0001','Equipo 1','Equipo numero 1','a9cbbbb4-798d-493d-98b6-b8587ec49d6a');
/*!40000 ALTER TABLE `dbur_agentes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dbur_categorias_personas`
--

DROP TABLE IF EXISTS `dbur_categorias_personas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dbur_categorias_personas` (
  `id_categoria` varchar(36) NOT NULL,
  `nombre_categoria` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dbur_categorias_personas`
--

LOCK TABLES `dbur_categorias_personas` WRITE;
/*!40000 ALTER TABLE `dbur_categorias_personas` DISABLE KEYS */;
/*!40000 ALTER TABLE `dbur_categorias_personas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dbur_clientes_marcas`
--

DROP TABLE IF EXISTS `dbur_clientes_marcas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dbur_clientes_marcas` (
  `id_cliente` int(11) NOT NULL,
  `nombre_cliente` varchar(100) DEFAULT NULL,
  `correo` varchar(60) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `fecha_creacion_cliente` date NOT NULL,
  `id_usuario` int(11) NOT NULL,
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dbur_clientes_marcas`
--

LOCK TABLES `dbur_clientes_marcas` WRITE;
/*!40000 ALTER TABLE `dbur_clientes_marcas` DISABLE KEYS */;
INSERT INTO `dbur_clientes_marcas` VALUES (1004,'olive','','','2018-08-14',1004);
/*!40000 ALTER TABLE `dbur_clientes_marcas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dbur_desconocidos_fotos`
--

DROP TABLE IF EXISTS `dbur_desconocidos_fotos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dbur_desconocidos_fotos` (
  `id_desconocido_foto` varchar(36) NOT NULL,
  `encode_foto` blob,
  `url_foto` varchar(40) DEFAULT NULL,
  `fh_captura` datetime NOT NULL,
  `id_agente` varchar(20) NOT NULL,
  PRIMARY KEY (`id_desconocido_foto`),
  KEY `fk_dbur_desconocidos_fotos_dbur_agentes1_idx` (`id_agente`),
  CONSTRAINT `fk_dbur_desconocidos_fotos_dbur_agentes1` FOREIGN KEY (`id_agente`) REFERENCES `dbur_agentes` (`id_agente`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dbur_desconocidos_fotos`
--

LOCK TABLES `dbur_desconocidos_fotos` WRITE;
/*!40000 ALTER TABLE `dbur_desconocidos_fotos` DISABLE KEYS */;
/*!40000 ALTER TABLE `dbur_desconocidos_fotos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dbur_det_categorias_personas`
--

DROP TABLE IF EXISTS `dbur_det_categorias_personas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dbur_det_categorias_personas` (
  `id_det_categorias_persona` int(11) NOT NULL AUTO_INCREMENT,
  `id_categoria` varchar(36) NOT NULL,
  `id_persona` varchar(36) NOT NULL,
  PRIMARY KEY (`id_det_categorias_persona`),
  KEY `fk_dbur_det_categorias_personas_1_idx` (`id_categoria`),
  KEY `fk_dbur_det_categorias_personas_2_idx` (`id_persona`),
  CONSTRAINT `fk_dbur_det_categorias_personas_1` FOREIGN KEY (`id_categoria`) REFERENCES `dbur_categorias_personas` (`id_categoria`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_dbur_det_categorias_personas_2` FOREIGN KEY (`id_persona`) REFERENCES `dbur_personas` (`id_persona`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dbur_det_categorias_personas`
--

LOCK TABLES `dbur_det_categorias_personas` WRITE;
/*!40000 ALTER TABLE `dbur_det_categorias_personas` DISABLE KEYS */;
/*!40000 ALTER TABLE `dbur_det_categorias_personas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dbur_det_personas_atendidas`
--

DROP TABLE IF EXISTS `dbur_det_personas_atendidas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dbur_det_personas_atendidas` (
  `id_det_persona_atendida` varchar(36) NOT NULL,
  `fh_atendido` datetime NOT NULL,
  `id_persona` varchar(36) NOT NULL,
  `id_identificacion` varchar(36) NOT NULL,
  `sync` int(11) NOT NULL,
  PRIMARY KEY (`id_det_persona_atendida`),
  KEY `fk_dbur_det_personas_atendidas_1_idx` (`id_persona`),
  KEY `fk_dbur_det_personas_atendidas_2_idx` (`id_identificacion`),
  CONSTRAINT `fk_dbur_det_personas_atendidas_1` FOREIGN KEY (`id_persona`) REFERENCES `dbur_personas` (`id_persona`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_dbur_det_personas_atendidas_2` FOREIGN KEY (`id_identificacion`) REFERENCES `dbur_identificados` (`id_identificacion`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dbur_det_personas_atendidas`
--

LOCK TABLES `dbur_det_personas_atendidas` WRITE;
/*!40000 ALTER TABLE `dbur_det_personas_atendidas` DISABLE KEYS */;
/*!40000 ALTER TABLE `dbur_det_personas_atendidas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dbur_fotos`
--

DROP TABLE IF EXISTS `dbur_fotos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dbur_fotos` (
  `id_foto` varchar(36) NOT NULL,
  `encode_foto` blob,
  `url_foto` varchar(100) DEFAULT NULL,
  `fh_captura` datetime NOT NULL,
  `id_persona` varchar(36) NOT NULL,
  `sync` int(11) NOT NULL,
  PRIMARY KEY (`id_foto`),
  KEY `fk_dbur_fotos_1_idx` (`id_persona`),
  CONSTRAINT `fk_dbur_fotos_1` FOREIGN KEY (`id_persona`) REFERENCES `dbur_personas` (`id_persona`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dbur_fotos`
--

LOCK TABLES `dbur_fotos` WRITE;
/*!40000 ALTER TABLE `dbur_fotos` DISABLE KEYS */;
/*!40000 ALTER TABLE `dbur_fotos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dbur_identificados`
--

DROP TABLE IF EXISTS `dbur_identificados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dbur_identificados` (
  `id_identificacion` varchar(36) NOT NULL,
  `foto_match_stream` varchar(40) DEFAULT NULL,
  `foto_match_saved` varchar(40) DEFAULT NULL,
  `match_error` decimal(8,2) DEFAULT NULL,
  `fh_identificacion` datetime NOT NULL,
  `id_agente` varchar(20) NOT NULL,
  `id_persona` varchar(36) NOT NULL,
  PRIMARY KEY (`id_identificacion`),
  KEY `fk_dbur_identificados_1_idx` (`id_agente`),
  KEY `fk_dbur_identificados_dbur_personas1_idx` (`id_persona`),
  CONSTRAINT `fk_dbur_identificados_1` FOREIGN KEY (`id_agente`) REFERENCES `dbur_agentes` (`id_agente`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_dbur_identificados_dbur_personas1` FOREIGN KEY (`id_persona`) REFERENCES `dbur_personas` (`id_persona`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dbur_identificados`
--

LOCK TABLES `dbur_identificados` WRITE;
/*!40000 ALTER TABLE `dbur_identificados` DISABLE KEYS */;
/*!40000 ALTER TABLE `dbur_identificados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dbur_local_ubicaciones`
--

DROP TABLE IF EXISTS `dbur_local_ubicaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dbur_local_ubicaciones` (
  `id_local_ubicacion` varchar(36) NOT NULL,
  `nombre_local_ubicacion` varchar(100) DEFAULT NULL,
  `id_tipo_ubicacion` varchar(36) NOT NULL,
  `id_restaurante` varchar(36) NOT NULL,
  PRIMARY KEY (`id_local_ubicacion`),
  KEY `fk_dbur_local_ubicaciones_1_idx` (`id_tipo_ubicacion`),
  KEY `fk_dbur_local_ubicaciones_2_idx` (`id_restaurante`),
  CONSTRAINT `fk_dbur_local_ubicaciones_1` FOREIGN KEY (`id_tipo_ubicacion`) REFERENCES `dbur_tipos_ubicaciones` (`id_tipo_ubicacion`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_dbur_local_ubicaciones_2` FOREIGN KEY (`id_restaurante`) REFERENCES `dbur_restaurantes_sucursales` (`id_restaurante`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dbur_local_ubicaciones`
--

LOCK TABLES `dbur_local_ubicaciones` WRITE;
/*!40000 ALTER TABLE `dbur_local_ubicaciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `dbur_local_ubicaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dbur_personas`
--

DROP TABLE IF EXISTS `dbur_personas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dbur_personas` (
  `id_persona` varchar(36) NOT NULL,
  `nombre_persona` varchar(100) DEFAULT NULL,
  `apellido_persona` varchar(100) DEFAULT NULL,
  `alias_persona` varchar(100) DEFAULT NULL,
  `dia_nac` int(11) DEFAULT NULL,
  `mes_nac` int(11) DEFAULT NULL,
  `anio_nac` int(11) DEFAULT NULL,
  `fecha_reg_persona` date NOT NULL,
  `sync` int(11) NOT NULL,
  PRIMARY KEY (`id_persona`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dbur_personas`
--

LOCK TABLES `dbur_personas` WRITE;
/*!40000 ALTER TABLE `dbur_personas` DISABLE KEYS */;
/*!40000 ALTER TABLE `dbur_personas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dbur_restaurantes_sucursales`
--

DROP TABLE IF EXISTS `dbur_restaurantes_sucursales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dbur_restaurantes_sucursales` (
  `id_restaurante` varchar(36) NOT NULL,
  `chat_id_restaurante` varchar(45) DEFAULT NULL,
  `nombre_restaurante` varchar(100) DEFAULT NULL,
  `token_bot` varchar(300) DEFAULT NULL,
  `fecha_creacion_restaurante` date NOT NULL,
  `id_cliente` int(11) NOT NULL,
  PRIMARY KEY (`id_restaurante`),
  KEY `fk_dbur_restaurantes_1_idx` (`id_cliente`),
  CONSTRAINT `fk_dbur_restaurantes_1` FOREIGN KEY (`id_cliente`) REFERENCES `dbur_clientes_marcas` (`id_cliente`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dbur_restaurantes_sucursales`
--

LOCK TABLES `dbur_restaurantes_sucursales` WRITE;
/*!40000 ALTER TABLE `dbur_restaurantes_sucursales` DISABLE KEYS */;
INSERT INTO `dbur_restaurantes_sucursales` VALUES ('a9cbbbb4-798d-493d-98b6-b8587ec49d6a','',NULL,NULL,'2018-08-14',1004);
/*!40000 ALTER TABLE `dbur_restaurantes_sucursales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dbur_tipos_ubicaciones`
--

DROP TABLE IF EXISTS `dbur_tipos_ubicaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dbur_tipos_ubicaciones` (
  `id_tipo_ubicacion` varchar(36) NOT NULL,
  `nombre_tipo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_tipo_ubicacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dbur_tipos_ubicaciones`
--

LOCK TABLES `dbur_tipos_ubicaciones` WRITE;
/*!40000 ALTER TABLE `dbur_tipos_ubicaciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `dbur_tipos_ubicaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `det_info_personas`
--

DROP TABLE IF EXISTS `det_info_personas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `det_info_personas` (
  `id_det_info_persona` varchar(36) NOT NULL,
  `bebida_persona` varchar(100) DEFAULT NULL,
  `plato_persona` varchar(100) DEFAULT NULL,
  `notas_persona` varchar(300) DEFAULT NULL,
  `id_persona` varchar(36) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `sync` int(11) NOT NULL,
  PRIMARY KEY (`id_det_info_persona`),
  KEY `fk_det_info_personas_dbur_personas1_idx` (`id_persona`),
  KEY `fk_det_info_personas_dbur_clientes1_idx` (`id_cliente`),
  CONSTRAINT `fk_det_info_personas_dbur_clientes1` FOREIGN KEY (`id_cliente`) REFERENCES `dbur_clientes_marcas` (`id_cliente`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_det_info_personas_dbur_personas1` FOREIGN KEY (`id_persona`) REFERENCES `dbur_personas` (`id_persona`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `det_info_personas`
--

LOCK TABLES `det_info_personas` WRITE;
/*!40000 ALTER TABLE `det_info_personas` DISABLE KEYS */;
/*!40000 ALTER TABLE `det_info_personas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-08-14 17:32:56
