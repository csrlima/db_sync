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
INSERT INTO `dbur_agentes` VALUES ('ursv0001','Equipo 1','Desarrollo en Oficina','a9cbbbb4-798d-493d-98b6-b8587ec49d6a');
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
INSERT INTO `dbur_categorias_personas` VALUES ('02ea26dc-90e4-43fb-b67c-f2f372e76d49','Diputados'),('1f532828-12e8-476f-927d-5a010d8bbb5b','Oficina Market Beat'),('2536f0cb-4c56-4a70-9e93-68a94f2c8dd1','Staff'),('403637a9-7818-4f88-b4bd-81577d955440','Farandula');
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
INSERT INTO `dbur_clientes_marcas` VALUES (1004,'olive garden','','','2018-08-14',1004);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dbur_det_categorias_personas`
--

LOCK TABLES `dbur_det_categorias_personas` WRITE;
/*!40000 ALTER TABLE `dbur_det_categorias_personas` DISABLE KEYS */;
/*!40000 ALTER TABLE `dbur_det_categorias_personas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dbur_det_info_personas`
--

DROP TABLE IF EXISTS `dbur_det_info_personas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dbur_det_info_personas` (
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
-- Dumping data for table `dbur_det_info_personas`
--

LOCK TABLES `dbur_det_info_personas` WRITE;
/*!40000 ALTER TABLE `dbur_det_info_personas` DISABLE KEYS */;
INSERT INTO `dbur_det_info_personas` VALUES ('001c4ff5-d21b-4b95-8760-9589d9fdc4bd',NULL,NULL,NULL,'001c4ff5-d21b-4b95-8760-9589d9fdc4bd',1004,0),('00ce4564-bbeb-431a-a2c4-57513a59fe86',NULL,NULL,NULL,'00ce4564-bbeb-431a-a2c4-57513a59fe86',1004,0),('23da570e-81bd-4a21-9139-f3844760273f','',NULL,'','23da570e-81bd-4a21-9139-f3844760273f',1004,0);
/*!40000 ALTER TABLE `dbur_det_info_personas` ENABLE KEYS */;
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
INSERT INTO `dbur_fotos` VALUES ('013da21b-08ca-415d-8ab2-b445ac124451','','013da21b-08ca-415d-8ab2-b445ac124451.jpg','2018-08-01 06:00:00','200c6961-b5e9-4121-a777-29e9aae8362b',0),('0173f62b-91a8-4f44-839e-c762940677c7','','0173f62b-91a8-4f44-839e-c762940677c7.jpg','2018-08-01 06:00:00','21b76b9b-23bf-4eb3-b68a-28f8192fba55',0),('028ad00c-ccd9-43cb-b218-1925052de084','','028ad00c-ccd9-43cb-b218-1925052de084.jpg','2018-08-01 06:00:00','a93db687-aeae-4966-829f-db55955bf180',0),('033a18f8-58b8-43e1-9679-cc87f56cdc52','','033a18f8-58b8-43e1-9679-cc87f56cdc52.jpg','2018-08-01 06:00:00','72327744-1679-4e01-a3cb-611a614c3fdd',0),('039acbd5-bd11-4800-a5f8-f6e65e202c1c','','039acbd5-bd11-4800-a5f8-f6e65e202c1c.jpg','2018-08-01 06:00:00','16deee0d-2b87-4787-baff-c6c6d42af457',0),('04461962-5ec4-46f2-83a5-1b567d68c4bb','','04461962-5ec4-46f2-83a5-1b567d68c4bb.jpg','2018-08-01 06:00:00','d62904ca-ce06-4b8b-9127-e80acaf7bdf8',0),('04721403-352b-4dc1-8b4a-1c2baa32c917','','04721403-352b-4dc1-8b4a-1c2baa32c917.jpg','2018-08-01 06:00:00','b463b9ee-6bf6-4b80-933e-9bd6f9cadc8b',0),('073dbe4c-88a4-4eab-95ec-880868af83ad','','073dbe4c-88a4-4eab-95ec-880868af83ad.jpg','2018-08-01 06:00:00','fff43918-405c-463c-9a67-7192ec3022c7',0),('0778d597-bd59-4590-8a15-0e57078b37f0','','0778d597-bd59-4590-8a15-0e57078b37f0.jpg','2018-08-01 06:00:00','0c9d4458-a0ff-4ac7-8c8b-5fd4a3e6f753',0),('0a3f2cfb-9a98-45b5-9093-abca60c10cd9','','0a3f2cfb-9a98-45b5-9093-abca60c10cd9.jpg','2018-08-01 06:00:00','21d36b97-6ce5-4add-b16b-fe236a552589',0),('0a5df21c-0731-452e-be37-5a10a2093942','','0a5df21c-0731-452e-be37-5a10a2093942.jpg','2018-08-01 06:00:00','926831bc-6890-4e5b-a562-9683cb3051a1',0),('0aa4d4d6-5058-4628-adfe-998f09471a3f','','0aa4d4d6-5058-4628-adfe-998f09471a3f.jpg','2018-08-01 06:00:00','48683ae8-b354-4857-88b8-aef7e29bb0d5',0),('0c18555d-620a-4099-9ab0-88eb71805ade','','0c18555d-620a-4099-9ab0-88eb71805ade.jpg','2018-08-01 06:00:00','7c1d8c33-8fd1-4f9f-baf3-c9e6eb9cd03b',0),('0c7616ff-2ab1-40ec-8986-9a137a2a5642','','0c7616ff-2ab1-40ec-8986-9a137a2a5642.jpg','2018-08-01 06:00:00','87857636-14d0-45dc-870f-eb442f8b0822',0),('0e089920-37c6-4909-99e8-f860c9fb3380','','0e089920-37c6-4909-99e8-f860c9fb3380.jpg','2018-08-01 06:00:00','b9505a0f-65a2-48e9-9628-43d8ec06a3b5',0),('0ff6f0e7-1ab8-4031-b31e-37d5c897721a','','0ff6f0e7-1ab8-4031-b31e-37d5c897721a.jpg','2018-08-01 06:00:00','1f661943-af65-485a-83d3-990fb1828898',0),('105e608e-5869-4f32-b50b-508d1eddfb50','','105e608e-5869-4f32-b50b-508d1eddfb50.jpg','2018-08-01 06:00:00','f00573ac-efab-4319-826b-864420982996',0),('10e14324-3ad1-4548-9470-3e471e47062c','','10e14324-3ad1-4548-9470-3e471e47062c.jpg','2018-08-01 06:00:00','db06ccea-24c0-45ff-bd45-7afc37761be7',0),('118d34ad-42f5-4b1f-9f61-7b5aad24915a','','118d34ad-42f5-4b1f-9f61-7b5aad24915a.jpg','2018-08-01 06:00:00','6b5c8cb1-14fd-4afe-93ab-515acaadac8e',0),('13265270-af8d-4706-874c-a47870fd0f9f','','13265270-af8d-4706-874c-a47870fd0f9f.jpg','2018-08-01 06:00:00','3bb3720c-2d8b-4b09-9840-922481502c2e',0),('13285e76-0f60-4b8c-b089-6f6e36586524','','13285e76-0f60-4b8c-b089-6f6e36586524.jpg','2018-08-01 06:00:00','c0a382e3-2348-469d-8c83-9f1b20f7f53f',0),('1372633c-dcaf-412a-83ca-021b4cee66a7','','1372633c-dcaf-412a-83ca-021b4cee66a7.jpg','2018-08-01 06:00:00','02569d11-806b-4413-8fc5-9b721dbb39e4',0),('1553ddc9-2208-4aeb-b0d6-70eaae4e4ccf','','1553ddc9-2208-4aeb-b0d6-70eaae4e4ccf.jpg','2018-08-01 06:00:00','8e1eaec4-f577-4a61-a163-7136e0eab0e8',0),('18f0c0ba-d024-4dd9-9324-ff203bf9999c','','18f0c0ba-d024-4dd9-9324-ff203bf9999c.jpg','2018-08-01 06:00:00','2808966e-488d-46bb-a2db-05129d12e2af',0),('1cbe66ed-6ffb-4ee8-9887-12ce4a0b7531','','1cbe66ed-6ffb-4ee8-9887-12ce4a0b7531.jpg','2018-08-01 06:00:00','04805d00-1684-4c76-81e0-993fcb1ba841',0),('201e18df-14ca-4122-8a59-c980ff17b0c0','','201e18df-14ca-4122-8a59-c980ff17b0c0.jpg','2018-08-01 06:00:00','9c7bda77-02bd-4ebe-a46a-d12580607946',0),('2076e057-9605-4fe6-bd8b-0c0671930a37','','2076e057-9605-4fe6-bd8b-0c0671930a37.jpg','2018-08-01 06:00:00','7c1d8c33-8fd1-4f9f-baf3-c9e6eb9cd03b',0),('20c37295-024b-4bc6-97a1-d27f371891e0','','20c37295-024b-4bc6-97a1-d27f371891e0.jpg','2018-08-01 06:00:00','c7b685e3-f567-45c4-8ebc-ddf1d84402fe',0),('216fc646-cebd-4b51-879c-dc2cd5f99dc9','','216fc646-cebd-4b51-879c-dc2cd5f99dc9.jpg','2018-08-01 06:00:00','1f661943-af65-485a-83d3-990fb1828898',0),('21b41533-e67e-471d-b0b4-0742aa19a6c4','','21b41533-e67e-471d-b0b4-0742aa19a6c4.jpg','2018-08-01 06:00:00','8e1eaec4-f577-4a61-a163-7136e0eab0e8',0),('21c897fd-4287-493a-8582-41da33e74dd0','','21c897fd-4287-493a-8582-41da33e74dd0.jpg','2018-08-01 06:00:00','02569d11-806b-4413-8fc5-9b721dbb39e4',0),('22850652-552e-4bff-bf0c-f0e2d8fc167b','','22850652-552e-4bff-bf0c-f0e2d8fc167b.jpg','2018-08-01 06:00:00','962e5c40-a931-4616-b6d3-8662e370305c',0),('24cf265e-4793-485b-8b37-5a4b0e45692a','','24cf265e-4793-485b-8b37-5a4b0e45692a.jpg','2018-08-01 06:00:00','eef21415-b5d7-400c-83ec-dbc62c91b116',0),('25683207-c963-4a15-ba2f-dc14c502ff4a','','25683207-c963-4a15-ba2f-dc14c502ff4a.jpg','2018-08-01 06:00:00','bc607b55-757c-4aa0-a329-6e072f6f4f7b',0),('27e3509f-1ec5-4f8e-bb46-23a036bae041','','27e3509f-1ec5-4f8e-bb46-23a036bae041.jpg','2018-08-01 06:00:00','4fc25eae-9ead-4b5b-bbee-9ca5f2473c5a',0),('2805e43c-1508-4137-bf8d-210c0606ec09','','2805e43c-1508-4137-bf8d-210c0606ec09.jpg','2018-08-01 06:00:00','16deee0d-2b87-4787-baff-c6c6d42af457',0),('28869712-b025-438b-955f-a1fea321efaf','','28869712-b025-438b-955f-a1fea321efaf.jpg','2018-08-01 06:00:00','8d337c03-93ce-4379-8782-f7c943bc972e',0),('28b26b55-f30d-4c88-9c2c-ec230c8ac483','','28b26b55-f30d-4c88-9c2c-ec230c8ac483.jpg','2018-08-01 06:00:00','378154ae-28e2-48a4-8aff-fcbd1ca4b4aa',0),('28cdfd0e-1c7e-4b31-a041-f5cb9634fa7f','','28cdfd0e-1c7e-4b31-a041-f5cb9634fa7f.jpg','2018-08-01 06:00:00','b9505a0f-65a2-48e9-9628-43d8ec06a3b5',0),('2a99c191-3b63-4e32-895d-4cb3c34cabe0','','2a99c191-3b63-4e32-895d-4cb3c34cabe0.jpg','2018-08-01 06:00:00','926831bc-6890-4e5b-a562-9683cb3051a1',0),('2b39a1a2-3766-4e62-a0f4-8f8144d86424','','2b39a1a2-3766-4e62-a0f4-8f8144d86424.jpg','2018-08-01 06:00:00','d62904ca-ce06-4b8b-9127-e80acaf7bdf8',0),('2bf8d8b0-07b3-4606-abd3-3266ce88df89','','2bf8d8b0-07b3-4606-abd3-3266ce88df89.jpg','2018-08-01 06:00:00','bb213556-db0b-417e-846b-9df9f23ab311',0),('2c96d364-edae-402e-a34b-9b49054939cf','','2c96d364-edae-402e-a34b-9b49054939cf.jpg','2018-08-01 06:00:00','93954631-3d1b-47d8-8881-75d93cbc8dd1',0),('2cf82997-5506-48db-87da-9056d82cbb53','','2cf82997-5506-48db-87da-9056d82cbb53.jpg','2018-08-01 06:00:00','9b85468e-a336-4049-924c-e7278d6de58e',0),('2d97f5e8-86fe-423d-a07d-63189388d512','','2d97f5e8-86fe-423d-a07d-63189388d512.jpg','2018-08-01 06:00:00','ccb4a979-cbdf-4d23-bd0a-efd251284388',0),('2e0745b8-d7da-4f60-a754-29da0b4ff4ef','','2e0745b8-d7da-4f60-a754-29da0b4ff4ef.jpg','2018-08-01 06:00:00','2bb6e241-4b2d-4f16-94a6-94b614302d30',0),('2e26a341-b5eb-48c7-bbba-9bc228da4817','','2e26a341-b5eb-48c7-bbba-9bc228da4817.jpg','2018-08-01 06:00:00','3e5e06dc-7603-46e1-89f7-c4aaaadfd873',0),('2e3b74f4-0720-4593-af86-5c16f6034b55','','2e3b74f4-0720-4593-af86-5c16f6034b55.jpg','2018-08-01 06:00:00','85abe0b5-279f-47c3-8ff3-1b6fea2372a1',0),('30feb936-87a8-48c4-9d8e-498dee6aaa49','','30feb936-87a8-48c4-9d8e-498dee6aaa49.jpg','2018-08-01 06:00:00','72327744-1679-4e01-a3cb-611a614c3fdd',0),('3127a047-8eb6-4b2c-8f74-196fd786e617','','3127a047-8eb6-4b2c-8f74-196fd786e617.jpg','2018-08-01 06:00:00','48683ae8-b354-4857-88b8-aef7e29bb0d5',0),('315ecc5e-5e3f-4a14-961e-5358bff18f68','','315ecc5e-5e3f-4a14-961e-5358bff18f68.jpg','2018-08-01 06:00:00','c723f764-e89f-4d36-baa2-8edf8a60f3dc',0),('32ce86e1-e1d6-4e4e-a3c8-ffdc092d8eed','','32ce86e1-e1d6-4e4e-a3c8-ffdc092d8eed.jpg','2018-08-01 06:00:00','962e5c40-a931-4616-b6d3-8662e370305c',0),('354e0107-1914-4d8d-b037-3f30a6adf243','','354e0107-1914-4d8d-b037-3f30a6adf243.jpg','2018-08-01 06:00:00','2808966e-488d-46bb-a2db-05129d12e2af',0),('37760669-8cde-4c44-aec8-55f219b31b95','','37760669-8cde-4c44-aec8-55f219b31b95.jpg','2018-08-01 06:00:00','25e5260f-0302-4db4-b584-d40611981423',0),('377a37a0-b7e6-413b-a800-aaa94eb71ccb','','377a37a0-b7e6-413b-a800-aaa94eb71ccb.jpg','2018-08-01 06:00:00','79a7e361-90ed-49a1-aa40-5b3a492445ab',0),('38af6ffd-9bd3-4655-a94b-ef1229e37a3f','','38af6ffd-9bd3-4655-a94b-ef1229e37a3f.jpg','2018-08-01 06:00:00','df5b83ce-9bc1-425c-9c4c-10bcf7eed16d',0),('39fce5fe-8575-46ee-9ef7-47d9f92c3728','','39fce5fe-8575-46ee-9ef7-47d9f92c3728.jpg','2018-08-01 06:00:00','ed4577eb-f7ef-4e52-bffb-b9a3dda94b76',0),('3a56a4aa-af62-45a2-ad96-dcbdf8bfb4da','','3a56a4aa-af62-45a2-ad96-dcbdf8bfb4da.jpg','2018-08-01 06:00:00','b86cf34f-85e8-48f4-a52c-8dfbf33627e1',0),('3b935ccc-c737-496a-b4b5-a254126cf047','','3b935ccc-c737-496a-b4b5-a254126cf047.jpg','2018-08-01 06:00:00','bbde5509-04ce-425d-988f-64ee955d76b3',0),('3bc0b57a-7ac6-4072-aa7b-941676da063f','','3bc0b57a-7ac6-4072-aa7b-941676da063f.jpg','2018-08-01 06:00:00','d33c6a9a-0bd9-4288-b335-4d6519169111',0),('3df54f21-be72-4449-a337-c704e03b9416','','3df54f21-be72-4449-a337-c704e03b9416.jpg','2018-08-01 06:00:00','0760d51f-74fc-47a8-bda8-614c646cb202',0),('3df7298b-84da-4af2-a15b-86652a910b29','','3df7298b-84da-4af2-a15b-86652a910b29.jpg','2018-08-01 06:00:00','200c6961-b5e9-4121-a777-29e9aae8362b',0),('3e195dea-b573-4fbc-8542-f35e567dc399','','3e195dea-b573-4fbc-8542-f35e567dc399.jpg','2018-08-01 06:00:00','eef21415-b5d7-400c-83ec-dbc62c91b116',0),('3e425a0c-8a6b-446a-8b72-cca989284810','','3e425a0c-8a6b-446a-8b72-cca989284810.jpg','2018-08-01 06:00:00','81fd68e8-cb6e-4578-bf32-3ce2ff659791',0),('3ef30b3b-7fac-45bc-87bb-8daf929cbb6c','','3ef30b3b-7fac-45bc-87bb-8daf929cbb6c.jpg','2018-08-01 06:00:00','bbde5509-04ce-425d-988f-64ee955d76b3',0),('3f21ed9c-ed80-4041-a6c1-df8515ce113f','','3f21ed9c-ed80-4041-a6c1-df8515ce113f.jpg','2018-08-01 06:00:00','2fa00bb1-c852-46cc-bdaf-95e931a79376',0),('3f6f7e4c-6103-4b1e-9e5e-6937f5049a94','','3f6f7e4c-6103-4b1e-9e5e-6937f5049a94.jpg','2018-08-01 06:00:00','12270ac6-b298-4dd1-a009-8e7f4cdb6100',0),('4251ca0b-8e64-4409-a37f-ef183cd1204f','','4251ca0b-8e64-4409-a37f-ef183cd1204f.jpg','2018-08-01 06:00:00','00ce4564-bbeb-431a-a2c4-57513a59fe86',0),('440a4df7-fb7a-4632-801c-bcfa238df04d','','440a4df7-fb7a-4632-801c-bcfa238df04d.jpg','2018-08-01 06:00:00','b463b9ee-6bf6-4b80-933e-9bd6f9cadc8b',0),('46885b06-a95a-4b17-8ca6-c354ffba6302','','46885b06-a95a-4b17-8ca6-c354ffba6302.jpg','2018-08-01 06:00:00','63e04470-f0a1-4a59-a79d-f755b4e56144',0),('46cacb6c-aef0-47d6-98e1-3ed33feb6f64','','46cacb6c-aef0-47d6-98e1-3ed33feb6f64.jpg','2018-08-01 06:00:00','21b76b9b-23bf-4eb3-b68a-28f8192fba55',0),('4810577a-2ff3-4e15-bbc0-6679d169ab58','','4810577a-2ff3-4e15-bbc0-6679d169ab58.jpg','2018-08-01 06:00:00','2bb6e241-4b2d-4f16-94a6-94b614302d30',0),('4904df60-1fdc-4ece-918d-711a9be73c20','','4904df60-1fdc-4ece-918d-711a9be73c20.jpg','2018-08-01 06:00:00','85abe0b5-279f-47c3-8ff3-1b6fea2372a1',0),('49774133-907d-483b-a201-702f65fe99d1','','49774133-907d-483b-a201-702f65fe99d1.jpg','2018-08-01 06:00:00','df48e4c2-b5ec-4f46-94d0-11a4dd505790',0),('4ab9db74-5089-49fc-8837-62f127916236','','4ab9db74-5089-49fc-8837-62f127916236.jpg','2018-08-01 06:00:00','e46908cd-055c-473e-8045-600d4f564263',0),('4b4b47a6-1103-4613-84e6-25aef95817fd','','4b4b47a6-1103-4613-84e6-25aef95817fd.jpg','2018-08-01 06:00:00','d33c6a9a-0bd9-4288-b335-4d6519169111',0),('4b60d98b-d1b8-4dc0-bf06-0d8aa0efe298','','4b60d98b-d1b8-4dc0-bf06-0d8aa0efe298.jpg','2018-08-01 06:00:00','991d26c6-a462-4ef5-9683-4d6f279ebd34',0),('4cde5eff-cab7-4efc-aeee-d26b90639e87','','4cde5eff-cab7-4efc-aeee-d26b90639e87.jpg','2018-08-01 06:00:00','962e5c40-a931-4616-b6d3-8662e370305c',0),('4d7f36d6-e210-4ff9-bacd-b30a2d871d37','','4d7f36d6-e210-4ff9-bacd-b30a2d871d37.jpg','2018-08-01 06:00:00','f69370d6-baca-4748-8d0f-5a58ab18e7b8',0),('4d8d8d03-3dff-4b79-8064-ae85025bde30','','4d8d8d03-3dff-4b79-8064-ae85025bde30.jpg','2018-08-01 06:00:00','fff43918-405c-463c-9a67-7192ec3022c7',0),('4dc56a1b-9a47-49cf-9ed7-9e2723cb4825','','4dc56a1b-9a47-49cf-9ed7-9e2723cb4825.jpg','2018-08-01 06:00:00','3353d23e-b6d8-4d98-81c6-1d3e74f09228',0),('4dfd470e-a9f3-4724-abb3-114660aa9ac9','','4dfd470e-a9f3-4724-abb3-114660aa9ac9.jpg','2018-08-01 06:00:00','a2f9c105-9e81-423a-93b0-cb79d9b08827',0),('4e38941f-c9d1-4ef7-a25d-c463357def4e','','4e38941f-c9d1-4ef7-a25d-c463357def4e.jpg','2018-08-01 06:00:00','16deee0d-2b87-4787-baff-c6c6d42af457',0),('4e4c46bf-900b-4d78-8704-09de00be868a','','4e4c46bf-900b-4d78-8704-09de00be868a.jpg','2018-08-01 06:00:00','37c31ec4-25d3-48e1-884d-b15c14d7e4da',0),('4fc5cc7e-a595-49a3-af25-ba029fbba00d','','4fc5cc7e-a595-49a3-af25-ba029fbba00d.jpg','2018-08-01 06:00:00','55dd8a94-ef1f-4694-aa66-3d54eb34ee97',0),('4ffc6f8c-a2a4-4c73-ae23-43d5f8e0f41e','','4ffc6f8c-a2a4-4c73-ae23-43d5f8e0f41e.jpg','2018-08-01 06:00:00','33622644-09a4-43e3-b3f6-a272fc92e43f',0),('5013f258-dcd5-4f7c-89aa-94827bc839bb','','5013f258-dcd5-4f7c-89aa-94827bc839bb.jpg','2018-08-01 06:00:00','2bb6e241-4b2d-4f16-94a6-94b614302d30',0),('513bf364-2d3c-4b7d-b3b0-ba6215a19002','','513bf364-2d3c-4b7d-b3b0-ba6215a19002.jpg','2018-08-01 06:00:00','72327744-1679-4e01-a3cb-611a614c3fdd',0),('521224d5-a8db-4a7b-b69a-054555c3e3e4','','521224d5-a8db-4a7b-b69a-054555c3e3e4.jpg','2018-08-01 06:00:00','1efa9baf-30f0-4f0f-b037-988a4bb82d40',0),('52559521-257e-48ed-94d6-b69a4e8e316c','','52559521-257e-48ed-94d6-b69a4e8e316c.jpg','2018-08-01 06:00:00','b86cf34f-85e8-48f4-a52c-8dfbf33627e1',0),('52b98a8f-b301-489f-b41d-8791e6a7fc87','','52b98a8f-b301-489f-b41d-8791e6a7fc87.jpg','2018-08-01 06:00:00','ffc2b6b5-111d-429f-a151-d469e484273c',0),('530003d9-490a-4cba-a223-6ea5b64ed1fd','','530003d9-490a-4cba-a223-6ea5b64ed1fd.jpg','2018-08-01 06:00:00','edd10b8b-5fad-41f0-823e-16a0dd20650a',0),('536f5271-4458-4578-8dc1-20e512ee065a','','536f5271-4458-4578-8dc1-20e512ee065a.jpg','2018-08-01 06:00:00','48683ae8-b354-4857-88b8-aef7e29bb0d5',0),('5394fb0c-e079-401d-9691-014d82d4cd50','','5394fb0c-e079-401d-9691-014d82d4cd50.jpg','2018-08-01 06:00:00','b9505a0f-65a2-48e9-9628-43d8ec06a3b5',0),('540cc519-801f-4ac7-ad26-5c28bd1fbcf6','','540cc519-801f-4ac7-ad26-5c28bd1fbcf6.jpg','2018-08-01 06:00:00','4281f040-6885-41ab-b431-e38b2a9bc975',0),('54b6be4c-00a5-438c-820e-74ec0ac437ab','','54b6be4c-00a5-438c-820e-74ec0ac437ab.jpg','2018-08-01 06:00:00','6b5c8cb1-14fd-4afe-93ab-515acaadac8e',0),('56674c45-161c-4fb2-9044-6aaaff05c92d','','56674c45-161c-4fb2-9044-6aaaff05c92d.jpg','2018-08-01 06:00:00','f00573ac-efab-4319-826b-864420982996',0),('56a3fc3b-940e-4923-96bc-e4f638af62b7','','56a3fc3b-940e-4923-96bc-e4f638af62b7.jpg','2018-08-01 06:00:00','dd27cbc9-4be4-480c-85ac-67eba7f95660',0),('576220e6-562a-443a-8dcf-7ffeacab7153','','576220e6-562a-443a-8dcf-7ffeacab7153.jpg','2018-08-01 06:00:00','9ad94bb1-590d-412d-a87b-3799fd555f72',0),('59b8f2b4-4540-4541-b8d0-05ad28cc7a9e','','59b8f2b4-4540-4541-b8d0-05ad28cc7a9e.jpg','2018-08-01 06:00:00','c9fecc3a-5120-4e58-a193-bd6cf7df40fe',0),('5a0fc790-d80c-40ff-a4f3-60a3ad1784a3','','5a0fc790-d80c-40ff-a4f3-60a3ad1784a3.jpg','2018-08-01 06:00:00','c9fecc3a-5120-4e58-a193-bd6cf7df40fe',0),('5af21b33-f115-4795-b920-9fb2508574a0','','5af21b33-f115-4795-b920-9fb2508574a0.jpg','2018-08-01 06:00:00','8d337c03-93ce-4379-8782-f7c943bc972e',0),('5c59431a-9149-4f09-aeae-53eaef66f8ab','','5c59431a-9149-4f09-aeae-53eaef66f8ab.jpg','2018-08-01 06:00:00','7bd3baf5-b203-46b5-83f6-3f250a24e442',0),('5cda0282-a275-4e46-b6fb-c71a6a3c8896','','5cda0282-a275-4e46-b6fb-c71a6a3c8896.jpg','2018-08-01 06:00:00','56f988b3-7d67-4fb7-ba7f-6dec92662174',0),('5cea644b-adbc-44f8-b0ea-a8591bed6c6f','','5cea644b-adbc-44f8-b0ea-a8591bed6c6f.jpg','2018-08-01 06:00:00','3533bed2-a00d-4df6-a126-e7a07bbf632b',0),('5dc49665-d9c0-42df-9a73-374452ae1614','','5dc49665-d9c0-42df-9a73-374452ae1614.jpg','2018-08-01 06:00:00','69af06f9-8a81-49f7-9f73-0bcc74de4b0d',0),('5e4de481-fe04-499b-8b76-4d71f7d5411f','','5e4de481-fe04-499b-8b76-4d71f7d5411f.jpg','2018-08-01 06:00:00','b00c9ddf-d323-4f6b-a27f-cde42017885c',0),('60f66727-983f-443e-bed9-7e9c234fc8ac','','60f66727-983f-443e-bed9-7e9c234fc8ac.jpg','2018-08-01 06:00:00','fff43918-405c-463c-9a67-7192ec3022c7',0),('616b22d4-0b0c-40a9-a4aa-d0c500edcbb2','','616b22d4-0b0c-40a9-a4aa-d0c500edcbb2.jpg','2018-08-01 06:00:00','f99dfaee-5985-48b8-9967-16f99b89dd67',0),('62a79d54-3017-46ab-8eda-bc6d1aead6df','','62a79d54-3017-46ab-8eda-bc6d1aead6df.jpg','2018-08-01 06:00:00','0760d51f-74fc-47a8-bda8-614c646cb202',0),('6395a832-fa15-416d-b03c-e6363d4ad781','','6395a832-fa15-416d-b03c-e6363d4ad781.jpg','2018-08-01 06:00:00','2fa00bb1-c852-46cc-bdaf-95e931a79376',0),('63b23d41-e242-4de6-80c2-dffed0f5761a','','63b23d41-e242-4de6-80c2-dffed0f5761a.jpg','2018-08-01 06:00:00','3533bed2-a00d-4df6-a126-e7a07bbf632b',0),('656721f0-cf90-443c-b644-9f885932f092','','656721f0-cf90-443c-b644-9f885932f092.jpg','2018-08-01 06:00:00','0b3bb7cc-23b7-46a6-b691-fbfbbfa2a29f',0),('65befe10-86e9-44f4-aec6-981611470487','','65befe10-86e9-44f4-aec6-981611470487.jpg','2018-08-01 06:00:00','79a7e361-90ed-49a1-aa40-5b3a492445ab',0),('67e3a1eb-1489-4205-bb6a-ef2d8f9330e3','','67e3a1eb-1489-4205-bb6a-ef2d8f9330e3.jpg','2018-08-01 06:00:00','f00573ac-efab-4319-826b-864420982996',0),('6900e96b-a32b-4a48-b016-15114e7f496c','','6900e96b-a32b-4a48-b016-15114e7f496c.jpg','2018-08-01 06:00:00','eef21415-b5d7-400c-83ec-dbc62c91b116',0),('6939b4b1-a5a0-4921-b1cf-9dd68ffee4a9','','6939b4b1-a5a0-4921-b1cf-9dd68ffee4a9.jpg','2018-08-01 06:00:00','a10f368a-94c8-4866-8649-dd47901e8d38',0),('696d8f54-d216-4d0d-a310-d5a76b6be3f2','','696d8f54-d216-4d0d-a310-d5a76b6be3f2.jpg','2018-08-01 06:00:00','33622644-09a4-43e3-b3f6-a272fc92e43f',0),('6c811158-f387-4e26-a834-6bc5577812c0','','6c811158-f387-4e26-a834-6bc5577812c0.jpg','2018-08-01 06:00:00','9d995fc6-d71c-45ec-9dce-6bd94c39a429',0),('6da6b433-e513-4749-9a6f-631053b01df0','','6da6b433-e513-4749-9a6f-631053b01df0.jpg','2018-08-01 06:00:00','a2351284-d537-41a8-aa39-cac654a19874',0),('6dc64162-3f7a-4a54-a0d3-f33472588b58','','6dc64162-3f7a-4a54-a0d3-f33472588b58.jpg','2018-08-01 06:00:00','f69370d6-baca-4748-8d0f-5a58ab18e7b8',0),('6e301d00-ab06-4e0a-8586-5767bacc37e5','','6e301d00-ab06-4e0a-8586-5767bacc37e5.jpg','2018-08-01 06:00:00','56f988b3-7d67-4fb7-ba7f-6dec92662174',0),('6e5eb9c8-3c64-42c4-bd85-20617b1fef2f','','6e5eb9c8-3c64-42c4-bd85-20617b1fef2f.jpg','2018-08-01 06:00:00','3353d23e-b6d8-4d98-81c6-1d3e74f09228',0),('6f4acfae-766e-4d97-9e49-15fff1d76e0a','','6f4acfae-766e-4d97-9e49-15fff1d76e0a.jpg','2018-08-01 06:00:00','2fa00bb1-c852-46cc-bdaf-95e931a79376',0),('702545e5-6092-4f77-bbb8-d8c2236c6433','','702545e5-6092-4f77-bbb8-d8c2236c6433.jpg','2018-08-01 06:00:00','a93db687-aeae-4966-829f-db55955bf180',0),('70991767-4a01-4fe2-8635-56f88e5fda0f','','70991767-4a01-4fe2-8635-56f88e5fda0f.jpg','2018-08-01 06:00:00','cb02e90e-0de9-4259-a1b1-a62a45274809',0),('70a3bc1f-20f3-424f-8db9-0d29464d9370','','70a3bc1f-20f3-424f-8db9-0d29464d9370.jpg','2018-08-01 06:00:00','28c688d8-43e6-44a4-ba27-ec3254d41c31',0),('72a716ec-03bd-4a92-9dc3-7e236136a59b','','72a716ec-03bd-4a92-9dc3-7e236136a59b.jpg','2018-08-01 06:00:00','c0a382e3-2348-469d-8c83-9f1b20f7f53f',0),('734464a9-17aa-413d-b246-a43243236eb7','','734464a9-17aa-413d-b246-a43243236eb7.jpg','2018-08-01 06:00:00','9b85468e-a336-4049-924c-e7278d6de58e',0),('734df018-7a0b-4748-9d5e-9dace3a0a0d6','','734df018-7a0b-4748-9d5e-9dace3a0a0d6.jpg','2018-08-01 06:00:00','68bde092-05e4-426a-84ee-e187320edcd3',0),('73c9336d-612c-4b40-a095-5facc083d8fc','','73c9336d-612c-4b40-a095-5facc083d8fc.jpg','2018-08-01 06:00:00','87857636-14d0-45dc-870f-eb442f8b0822',0),('74359dbb-564d-42ad-a5b7-1c2dd47e6edf','','74359dbb-564d-42ad-a5b7-1c2dd47e6edf.jpg','2018-08-01 06:00:00','12270ac6-b298-4dd1-a009-8e7f4cdb6100',0),('751ac91c-7593-474b-a129-a10fffcc883f','','751ac91c-7593-474b-a129-a10fffcc883f.jpg','2018-08-01 06:00:00','37c31ec4-25d3-48e1-884d-b15c14d7e4da',0),('75749f0d-018b-4c13-aafc-cec8f9c8cfe7','','75749f0d-018b-4c13-aafc-cec8f9c8cfe7.jpg','2018-08-01 06:00:00','6e2ae45e-629e-4340-92bd-1a0f52ed84c1',0),('75a05e59-9cab-49a6-abda-b2bee9439af1','','75a05e59-9cab-49a6-abda-b2bee9439af1.jpg','2018-08-01 06:00:00','d33c6a9a-0bd9-4288-b335-4d6519169111',0),('75ac769e-8f32-4f11-9f0b-1487a5bbf3f4','','75ac769e-8f32-4f11-9f0b-1487a5bbf3f4.jpg','2018-08-01 06:00:00','9d995fc6-d71c-45ec-9dce-6bd94c39a429',0),('77260ec8-85b4-488f-81b3-ca59163de8e0','','77260ec8-85b4-488f-81b3-ca59163de8e0.jpg','2018-08-01 06:00:00','68bde092-05e4-426a-84ee-e187320edcd3',0),('77ab38ba-b575-4f51-a899-c643ddf64108','','77ab38ba-b575-4f51-a899-c643ddf64108.jpg','2018-08-01 06:00:00','87857636-14d0-45dc-870f-eb442f8b0822',0),('78599fe1-a11a-4073-8f72-5391ce76dbb4','','78599fe1-a11a-4073-8f72-5391ce76dbb4.jpg','2018-08-01 06:00:00','4fc25eae-9ead-4b5b-bbee-9ca5f2473c5a',0),('79326f65-9fb4-439e-856f-e2097a233582','','79326f65-9fb4-439e-856f-e2097a233582.jpg','2018-08-01 06:00:00','8e1eaec4-f577-4a61-a163-7136e0eab0e8',0),('79f3bd54-c3ad-4b01-9f22-c4f26a698644','','79f3bd54-c3ad-4b01-9f22-c4f26a698644.jpg','2018-08-01 06:00:00','f00573ac-efab-4319-826b-864420982996',0),('7a398317-b049-4103-9959-bd9177ec0f1c','','7a398317-b049-4103-9959-bd9177ec0f1c.jpg','2018-08-01 06:00:00','bc607b55-757c-4aa0-a329-6e072f6f4f7b',0),('7b9a2179-d425-4117-9bd7-1fb9d1170827','','7b9a2179-d425-4117-9bd7-1fb9d1170827.jpg','2018-08-01 06:00:00','31eba55d-9c1d-4558-9d6f-2125c9561303',0),('7c926b53-af9b-4ade-9eb1-0934d1877b92','','7c926b53-af9b-4ade-9eb1-0934d1877b92.jpg','2018-08-01 06:00:00','07b4f01b-9ce2-40ab-8e22-c53af2f1621f',0),('7cc697df-a2f0-432d-b5af-5ec32a7f0dc5','','7cc697df-a2f0-432d-b5af-5ec32a7f0dc5.jpg','2018-08-01 06:00:00','0a1c779e-4edb-4e57-baff-17f4832f0201',0),('7f824a31-d00e-4fd2-ac5c-12fa51323a75','','7f824a31-d00e-4fd2-ac5c-12fa51323a75.jpg','2018-08-01 06:00:00','aa0d2e22-5d9d-4062-93e2-ca490adf26a3',0),('8005150c-b533-4787-913b-021d51b72dbe','','8005150c-b533-4787-913b-021d51b72dbe.jpg','2018-08-01 06:00:00','dd27cbc9-4be4-480c-85ac-67eba7f95660',0),('80405511-e440-4a78-8d3f-9ed8f9930c4f','','80405511-e440-4a78-8d3f-9ed8f9930c4f.jpg','2018-08-01 06:00:00','4281f040-6885-41ab-b431-e38b2a9bc975',0),('827c6e1d-4abd-44a2-ba3a-432fc84db663','','827c6e1d-4abd-44a2-ba3a-432fc84db663.jpg','2018-08-01 06:00:00','d62904ca-ce06-4b8b-9127-e80acaf7bdf8',0),('839c331e-3b37-4ade-839a-ddabc07c56cc','','839c331e-3b37-4ade-839a-ddabc07c56cc.jpg','2018-08-01 06:00:00','001c4ff5-d21b-4b95-8760-9589d9fdc4bd',0),('84428ee0-86b7-419a-abc9-03fa2ee0fe19','','84428ee0-86b7-419a-abc9-03fa2ee0fe19.jpg','2018-08-01 06:00:00','55dd8a94-ef1f-4694-aa66-3d54eb34ee97',0),('84ffd0ff-8fac-4dce-8bc8-044ea09c14dd','','84ffd0ff-8fac-4dce-8bc8-044ea09c14dd.jpg','2018-08-01 06:00:00','6e2ae45e-629e-4340-92bd-1a0f52ed84c1',0),('850ab988-46c1-4536-a127-55a459fe295b','','850ab988-46c1-4536-a127-55a459fe295b.jpg','2018-08-01 06:00:00','c7b685e3-f567-45c4-8ebc-ddf1d84402fe',0),('85c1b83b-05ca-4562-b377-a176d10e50e5','','85c1b83b-05ca-4562-b377-a176d10e50e5.jpg','2018-08-01 06:00:00','3353d23e-b6d8-4d98-81c6-1d3e74f09228',0),('85efa086-6190-4149-8c71-00383d131fed','','85efa086-6190-4149-8c71-00383d131fed.jpg','2018-08-01 06:00:00','f99dfaee-5985-48b8-9967-16f99b89dd67',0),('85f6e530-9704-4af0-ae37-f127d97069d8','','85f6e530-9704-4af0-ae37-f127d97069d8.jpg','2018-08-01 06:00:00','04805d00-1684-4c76-81e0-993fcb1ba841',0),('860730fd-3bed-4914-b4ed-95aae0056147','','860730fd-3bed-4914-b4ed-95aae0056147.jpg','2018-08-01 06:00:00','c36abd43-fde7-4ea6-bcc4-4cedad5b3b47',0),('860cbf41-65da-42a4-86f9-537a9bc089a9','','860cbf41-65da-42a4-86f9-537a9bc089a9.jpg','2018-08-01 06:00:00','5035d7f3-3c35-44bc-8d77-cb3e8090daf7',0),('86260422-de30-43d9-8400-05414c450de0','','86260422-de30-43d9-8400-05414c450de0.jpg','2018-08-01 06:00:00','85abe0b5-279f-47c3-8ff3-1b6fea2372a1',0),('86a64623-396d-404c-ac41-db6ec139feac','','86a64623-396d-404c-ac41-db6ec139feac.jpg','2018-08-01 06:00:00','2b6363dd-eb79-49f9-a47e-d01ac8c2df7b',0),('87382c63-e769-453f-ba87-82990e2b4cfe','','87382c63-e769-453f-ba87-82990e2b4cfe.jpg','2018-08-01 06:00:00','378154ae-28e2-48a4-8aff-fcbd1ca4b4aa',0),('876d9f1d-bcd4-43c8-beb4-9218e70bf15f','','876d9f1d-bcd4-43c8-beb4-9218e70bf15f.jpg','2018-08-01 06:00:00','991d26c6-a462-4ef5-9683-4d6f279ebd34',0),('87c67726-f40a-4b3a-b136-c012eaeeec5a','','87c67726-f40a-4b3a-b136-c012eaeeec5a.jpg','2018-08-01 06:00:00','fa1ac08f-f427-498d-9578-6885b9a3a172',0),('881e3ca5-e662-41ae-bed7-a198ac4cabd7','','881e3ca5-e662-41ae-bed7-a198ac4cabd7.jpg','2018-08-01 06:00:00','aa0d2e22-5d9d-4062-93e2-ca490adf26a3',0),('8a527424-9152-40e9-8001-7e9b2c8aca62','','8a527424-9152-40e9-8001-7e9b2c8aca62.jpg','2018-08-01 06:00:00','6b5c8cb1-14fd-4afe-93ab-515acaadac8e',0),('8bce079d-1785-4129-9e31-aeeded969d3c','','8bce079d-1785-4129-9e31-aeeded969d3c.jpg','2018-08-01 06:00:00','bc607b55-757c-4aa0-a329-6e072f6f4f7b',0),('8e0052a0-27c9-49c2-893b-3d96ebb3dd99','','8e0052a0-27c9-49c2-893b-3d96ebb3dd99.jpg','2018-08-01 06:00:00','02569d11-806b-4413-8fc5-9b721dbb39e4',0),('8f8cf73c-1d98-4ca9-8da6-a154d3b4e28e','','8f8cf73c-1d98-4ca9-8da6-a154d3b4e28e.jpg','2018-08-01 06:00:00','fa1ac08f-f427-498d-9578-6885b9a3a172',0),('9013caa7-77ff-4c1e-bc9c-5f773acfbc2f','','9013caa7-77ff-4c1e-bc9c-5f773acfbc2f.jpg','2018-08-01 06:00:00','b463b9ee-6bf6-4b80-933e-9bd6f9cadc8b',0),('90ac9047-a850-46f0-9f63-d54483c5bed0','','90ac9047-a850-46f0-9f63-d54483c5bed0.jpg','2018-08-01 06:00:00','a10f368a-94c8-4866-8649-dd47901e8d38',0),('9137e1c3-eee8-4073-b78e-533d18032ffe','','9137e1c3-eee8-4073-b78e-533d18032ffe.jpg','2018-08-01 06:00:00','9ad94bb1-590d-412d-a87b-3799fd555f72',0),('9282c7ce-69c0-453c-816a-7cd96f448338','','9282c7ce-69c0-453c-816a-7cd96f448338.jpg','2018-08-01 06:00:00','31eba55d-9c1d-4558-9d6f-2125c9561303',0),('928baef0-612b-4bd2-9279-ece364c10f84','','928baef0-612b-4bd2-9279-ece364c10f84.jpg','2018-08-01 06:00:00','c7b685e3-f567-45c4-8ebc-ddf1d84402fe',0),('92a43146-6d29-433a-8c3b-121e9661ba23','','92a43146-6d29-433a-8c3b-121e9661ba23.jpg','2018-08-01 06:00:00','991d26c6-a462-4ef5-9683-4d6f279ebd34',0),('941022ca-b60d-4fb4-b7db-8f7ca2edd0e3','','941022ca-b60d-4fb4-b7db-8f7ca2edd0e3.jpg','2018-08-01 06:00:00','33622644-09a4-43e3-b3f6-a272fc92e43f',0),('952276a9-f1eb-4eaf-9cbc-17d3cd47b090','','952276a9-f1eb-4eaf-9cbc-17d3cd47b090.jpg','2018-08-01 06:00:00','37c31ec4-25d3-48e1-884d-b15c14d7e4da',0),('96531211-6074-44a0-b44c-b20ace731153','','96531211-6074-44a0-b44c-b20ace731153.jpg','2018-08-01 06:00:00','cb02e90e-0de9-4259-a1b1-a62a45274809',0),('9673f46f-0bee-4236-9e5b-3ec2cbde6833','','9673f46f-0bee-4236-9e5b-3ec2cbde6833.jpg','2018-08-01 06:00:00','200c6961-b5e9-4121-a777-29e9aae8362b',0),('96e27384-702c-41d6-94d8-8ba88ab93f9e','','96e27384-702c-41d6-94d8-8ba88ab93f9e.jpg','2018-08-01 06:00:00','3e5e06dc-7603-46e1-89f7-c4aaaadfd873',0),('9769c459-2627-4bd2-a594-17e261ab891e','','9769c459-2627-4bd2-a594-17e261ab891e.jpg','2018-08-01 06:00:00','ccb4a979-cbdf-4d23-bd0a-efd251284388',0),('9ca2f32b-1cf0-44e7-ad96-0b7096cfb64d','','9ca2f32b-1cf0-44e7-ad96-0b7096cfb64d.jpg','2018-08-01 06:00:00','37c31ec4-25d3-48e1-884d-b15c14d7e4da',0),('9d309666-2284-404a-a0e0-c10226e7a319','','9d309666-2284-404a-a0e0-c10226e7a319.jpg','2018-08-01 06:00:00','7c1d8c33-8fd1-4f9f-baf3-c9e6eb9cd03b',0),('9d8b3e35-0cfa-419b-856c-65e255585435','','9d8b3e35-0cfa-419b-856c-65e255585435.jpg','2018-08-01 06:00:00','a10f368a-94c8-4866-8649-dd47901e8d38',0),('9e469b52-518a-47cf-94c7-47ccaa89bb6e','','9e469b52-518a-47cf-94c7-47ccaa89bb6e.jpg','2018-08-01 06:00:00','07b4f01b-9ce2-40ab-8e22-c53af2f1621f',0),('9ef8c8fa-1979-4247-92c5-8ce6ca949eab','','9ef8c8fa-1979-4247-92c5-8ce6ca949eab.jpg','2018-08-01 06:00:00','c0a382e3-2348-469d-8c83-9f1b20f7f53f',0),('9fa73adc-210a-41dd-b9f5-8bd6f2f0755b','','9fa73adc-210a-41dd-b9f5-8bd6f2f0755b.jpg','2018-08-01 06:00:00','21b76b9b-23bf-4eb3-b68a-28f8192fba55',0),('a1b1a450-723e-47ec-844c-472a3b681700','','a1b1a450-723e-47ec-844c-472a3b681700.jpg','2018-08-01 06:00:00','001c4ff5-d21b-4b95-8760-9589d9fdc4bd',0),('a3e6b457-7678-4aa0-8b92-2b21c696cb60','','a3e6b457-7678-4aa0-8b92-2b21c696cb60.jpg','2018-08-01 06:00:00','7bd3baf5-b203-46b5-83f6-3f250a24e442',0),('a45ff9ae-65df-4fd2-aa88-c45ea879d07e','','a45ff9ae-65df-4fd2-aa88-c45ea879d07e.jpg','2018-08-01 06:00:00','77916913-0046-449e-a17f-b9a1073c8304',0),('a487dfc1-0b7a-4b2d-95f4-d70eead2d7cf','','a487dfc1-0b7a-4b2d-95f4-d70eead2d7cf.jpg','2018-08-01 06:00:00','d01ff66f-7279-4b6f-8cd6-dcca21c43153',0),('a4fbab6d-abb9-43d1-aad3-e4cad9ef7cda','','a4fbab6d-abb9-43d1-aad3-e4cad9ef7cda.jpg','2018-08-01 06:00:00','c9fecc3a-5120-4e58-a193-bd6cf7df40fe',0),('a537f2b8-1c79-49ec-b458-825d5625fe54','','a537f2b8-1c79-49ec-b458-825d5625fe54.jpg','2018-08-01 06:00:00','db06ccea-24c0-45ff-bd45-7afc37761be7',0),('a78ad1d4-8294-46d7-a81a-ed772bd1fbb9','','a78ad1d4-8294-46d7-a81a-ed772bd1fbb9.jpg','2018-08-01 06:00:00','dd468fce-e477-448a-985a-e2ecb6cf02ef',0),('a7fa19f2-4e30-4178-bc8a-23bdb4f58d0a','','a7fa19f2-4e30-4178-bc8a-23bdb4f58d0a.jpg','2018-08-01 06:00:00','87857636-14d0-45dc-870f-eb442f8b0822',0),('a9b0df21-01c1-4366-9330-c5aad4e9a595','','a9b0df21-01c1-4366-9330-c5aad4e9a595.jpg','2018-08-01 06:00:00','6e2ae45e-629e-4340-92bd-1a0f52ed84c1',0),('a9e69671-b898-43c2-af96-a8b30dc09b7a','','a9e69671-b898-43c2-af96-a8b30dc09b7a.jpg','2018-08-01 06:00:00','926831bc-6890-4e5b-a562-9683cb3051a1',0),('aa39bf15-4187-4a66-82ce-28284b5d5744','','aa39bf15-4187-4a66-82ce-28284b5d5744.jpg','2018-08-01 06:00:00','001c4ff5-d21b-4b95-8760-9589d9fdc4bd',0),('ab35008c-e64e-4182-932b-8abb634c8ca8','','ab35008c-e64e-4182-932b-8abb634c8ca8.jpg','2018-08-01 06:00:00','d33c6a9a-0bd9-4288-b335-4d6519169111',0),('aba2501b-7a18-4261-8cb3-768edcc054f8','','aba2501b-7a18-4261-8cb3-768edcc054f8.jpg','2018-08-01 06:00:00','79a7e361-90ed-49a1-aa40-5b3a492445ab',0),('ac1b3b29-3c7e-45c8-8dc7-b5fa477a1497','','ac1b3b29-3c7e-45c8-8dc7-b5fa477a1497.jpg','2018-08-01 06:00:00','69af06f9-8a81-49f7-9f73-0bcc74de4b0d',0),('af34f8f0-7381-47d2-8168-a02264e1208e','','af34f8f0-7381-47d2-8168-a02264e1208e.jpg','2018-08-01 06:00:00','cd1b4ce9-38d1-4dde-a193-ae1a2c561ee1',0),('af70644f-b51c-4d7f-9f6a-c136f3c563be','','af70644f-b51c-4d7f-9f6a-c136f3c563be.jpg','2018-08-01 06:00:00','bba3a2bc-fc9f-4a5a-ace2-8c8c6b3569da',0),('b0294ec7-3dbe-4979-8b25-fadc30868c54','','b0294ec7-3dbe-4979-8b25-fadc30868c54.jpg','2018-08-01 06:00:00','72327744-1679-4e01-a3cb-611a614c3fdd',0),('b1100bd1-466d-4a9f-b33b-7d97529f4e18','','b1100bd1-466d-4a9f-b33b-7d97529f4e18.jpg','2018-08-01 06:00:00','68bde092-05e4-426a-84ee-e187320edcd3',0),('b1152314-79d7-4883-ad34-4e59414b132d','','b1152314-79d7-4883-ad34-4e59414b132d.jpg','2018-08-01 06:00:00','6e157876-eda4-414a-976b-481976e38042',0),('b13aa0c1-396d-4a71-afee-f28ddf518e9e','','b13aa0c1-396d-4a71-afee-f28ddf518e9e.jpg','2018-08-01 06:00:00','edd10b8b-5fad-41f0-823e-16a0dd20650a',0),('b1a090ae-ab21-4ccf-82b9-550c10874ab3','','b1a090ae-ab21-4ccf-82b9-550c10874ab3.jpg','2018-08-01 06:00:00','55dd8a94-ef1f-4694-aa66-3d54eb34ee97',0),('b2912566-ccd9-4d21-8fd0-7980d9d5a8e6','','b2912566-ccd9-4d21-8fd0-7980d9d5a8e6.jpg','2018-08-01 06:00:00','a2351284-d537-41a8-aa39-cac654a19874',0),('b2b99466-3c43-4d16-8445-9a9f13eb5632','','b2b99466-3c43-4d16-8445-9a9f13eb5632.jpg','2018-08-01 06:00:00','bc607b55-757c-4aa0-a329-6e072f6f4f7b',0),('b5f3b838-e3a3-4772-a8c4-0d6dffd43052','','b5f3b838-e3a3-4772-a8c4-0d6dffd43052.jpg','2018-08-01 06:00:00','63e04470-f0a1-4a59-a79d-f755b4e56144',0),('b6a42010-5812-4990-a7e9-c965678fb430','','b6a42010-5812-4990-a7e9-c965678fb430.jpg','2018-08-01 06:00:00','4281f040-6885-41ab-b431-e38b2a9bc975',0),('b6caf91f-e638-4ca3-ac4e-5dfa09f375ba','','b6caf91f-e638-4ca3-ac4e-5dfa09f375ba.jpg','2018-08-01 06:00:00','0a1c779e-4edb-4e57-baff-17f4832f0201',0),('b73eeb8f-24c1-4d0d-8e21-183ef8239734','','b73eeb8f-24c1-4d0d-8e21-183ef8239734.jpg','2018-08-01 06:00:00','3533bed2-a00d-4df6-a126-e7a07bbf632b',0),('bbfcc2d6-c6b2-44a2-949d-a913024aae46','','bbfcc2d6-c6b2-44a2-949d-a913024aae46.jpg','2018-08-01 06:00:00','9c7bda77-02bd-4ebe-a46a-d12580607946',0),('bc0c4a98-a129-4caa-b013-437ccdfa73c9','','bc0c4a98-a129-4caa-b013-437ccdfa73c9.jpg','2018-08-01 06:00:00','1014831b-c347-4265-966c-f593cc93346b',0),('bd3ce9f4-1cc0-46f6-8628-c9c981901478','','bd3ce9f4-1cc0-46f6-8628-c9c981901478.jpg','2018-08-01 06:00:00','28c688d8-43e6-44a4-ba27-ec3254d41c31',0),('bdfb2d1b-fd92-4590-bc63-272a1ff3ba01','','bdfb2d1b-fd92-4590-bc63-272a1ff3ba01.jpg','2018-08-01 06:00:00','79efb33b-e2bb-4489-a6c3-8888d620a383',0),('bdffcb1c-f5b3-4fb7-a118-373c3b265f1b','','bdffcb1c-f5b3-4fb7-a118-373c3b265f1b.jpg','2018-08-01 06:00:00','0a1c779e-4edb-4e57-baff-17f4832f0201',0),('be6453a9-49b9-4ac0-902b-6b730b6c3116','','be6453a9-49b9-4ac0-902b-6b730b6c3116.jpg','2018-08-01 06:00:00','4281f040-6885-41ab-b431-e38b2a9bc975',0),('be72fa5b-1dee-4c48-92a4-e1198dd3da07','','be72fa5b-1dee-4c48-92a4-e1198dd3da07.jpg','2018-08-01 06:00:00','68bde092-05e4-426a-84ee-e187320edcd3',0),('be9d8fa9-e80e-4ad4-bfb2-51e31a7ac34d','','be9d8fa9-e80e-4ad4-bfb2-51e31a7ac34d.jpg','2018-08-01 06:00:00','1efa9baf-30f0-4f0f-b037-988a4bb82d40',0),('bec7ab92-d9e8-4db8-869b-65be47106878','','bec7ab92-d9e8-4db8-869b-65be47106878.jpg','2018-08-01 06:00:00','0b3bb7cc-23b7-46a6-b691-fbfbbfa2a29f',0),('bfe46df0-b0c1-4867-afc5-c426cdb042e7','','bfe46df0-b0c1-4867-afc5-c426cdb042e7.jpg','2018-08-01 06:00:00','3bb3720c-2d8b-4b09-9840-922481502c2e',0),('c081216f-7a09-4b94-9400-eadeaf8a3214','','c081216f-7a09-4b94-9400-eadeaf8a3214.jpg','2018-08-01 06:00:00','d33c6a9a-0bd9-4288-b335-4d6519169111',0),('c3b77d1a-ef94-4446-88c4-8a3ac2e3f773','','c3b77d1a-ef94-4446-88c4-8a3ac2e3f773.jpg','2018-08-01 06:00:00','bba3a2bc-fc9f-4a5a-ace2-8c8c6b3569da',0),('c3fd9274-431d-4fd8-8265-2326ec10c101','','c3fd9274-431d-4fd8-8265-2326ec10c101.jpg','2018-08-01 06:00:00','04805d00-1684-4c76-81e0-993fcb1ba841',0),('c489ab1a-1db3-401f-a9e9-c0301232f14e','','c489ab1a-1db3-401f-a9e9-c0301232f14e.jpg','2018-08-01 06:00:00','12270ac6-b298-4dd1-a009-8e7f4cdb6100',0),('c718af14-e3cf-4715-bf18-61c391d0526a','','c718af14-e3cf-4715-bf18-61c391d0526a.jpg','2018-08-01 06:00:00','ed4577eb-f7ef-4e52-bffb-b9a3dda94b76',0),('c84e6a28-448f-4a74-9ff3-96f2e57b5234','','c84e6a28-448f-4a74-9ff3-96f2e57b5234.jpg','2018-08-01 06:00:00','d62904ca-ce06-4b8b-9127-e80acaf7bdf8',0),('c8510925-9b85-469b-b6f4-e79b1cf7fc21','','c8510925-9b85-469b-b6f4-e79b1cf7fc21.jpg','2018-08-01 06:00:00','edd10b8b-5fad-41f0-823e-16a0dd20650a',0),('c87c99ec-ca63-44e2-8cab-68be0b42411b','','c87c99ec-ca63-44e2-8cab-68be0b42411b.jpg','2018-08-01 06:00:00','ffc2b6b5-111d-429f-a151-d469e484273c',0),('c8ef0d32-2413-43e1-b268-8fda0461ebc9','','c8ef0d32-2413-43e1-b268-8fda0461ebc9.jpg','2018-08-01 06:00:00','4fc25eae-9ead-4b5b-bbee-9ca5f2473c5a',0),('c96c47cc-cf72-4b18-bf02-d9c1809ff111','','c96c47cc-cf72-4b18-bf02-d9c1809ff111.jpg','2018-08-01 06:00:00','fa1ac08f-f427-498d-9578-6885b9a3a172',0),('ca301705-f49d-43c7-b15a-9750401946f9','','ca301705-f49d-43c7-b15a-9750401946f9.jpg','2018-08-01 06:00:00','e46908cd-055c-473e-8045-600d4f564263',0),('ca4dc97a-cca7-4252-884d-e8b710132ab0','','ca4dc97a-cca7-4252-884d-e8b710132ab0.jpg','2018-08-01 06:00:00','378154ae-28e2-48a4-8aff-fcbd1ca4b4aa',0),('cb50b9c1-c990-438f-bb55-4f5e3e3b55ad','','cb50b9c1-c990-438f-bb55-4f5e3e3b55ad.jpg','2018-08-01 06:00:00','c9fecc3a-5120-4e58-a193-bd6cf7df40fe',0),('cc2404e3-d973-4512-aa01-71bfcd213420','','cc2404e3-d973-4512-aa01-71bfcd213420.jpg','2018-08-01 06:00:00','0c9d4458-a0ff-4ac7-8c8b-5fd4a3e6f753',0),('cc848123-5db4-4c6b-85db-2e6a8496b609','','cc848123-5db4-4c6b-85db-2e6a8496b609.jpg','2018-08-01 06:00:00','1014831b-c347-4265-966c-f593cc93346b',0),('cd31a99e-715d-48cf-ac76-4d2325bac7d5','','cd31a99e-715d-48cf-ac76-4d2325bac7d5.jpg','2018-08-01 06:00:00','23da570e-81bd-4a21-9139-f3844760273f',0),('cd9f19c2-d334-4c5d-b1f7-24e2ede5a37d','','cd9f19c2-d334-4c5d-b1f7-24e2ede5a37d.jpg','2018-08-01 06:00:00','69af06f9-8a81-49f7-9f73-0bcc74de4b0d',0),('cf9ec3f1-e165-47f8-b8b9-5e6e9f364db5','','cf9ec3f1-e165-47f8-b8b9-5e6e9f364db5.jpg','2018-08-01 06:00:00','bb213556-db0b-417e-846b-9df9f23ab311',0),('d0e806a5-128d-42e6-94e3-8f2cfb206ca3','','d0e806a5-128d-42e6-94e3-8f2cfb206ca3.jpg','2018-08-01 06:00:00','ccb4a979-cbdf-4d23-bd0a-efd251284388',0),('d29c928e-374f-4104-9dec-edbb157544f1','','d29c928e-374f-4104-9dec-edbb157544f1.jpg','2018-08-01 06:00:00','6e157876-eda4-414a-976b-481976e38042',0),('d2ee87a1-a791-4e60-a735-2b4ae865f2f4','','d2ee87a1-a791-4e60-a735-2b4ae865f2f4.jpg','2018-08-01 06:00:00','5035d7f3-3c35-44bc-8d77-cb3e8090daf7',0),('d4986ce4-b415-49ea-b28a-01a85117363b','','d4986ce4-b415-49ea-b28a-01a85117363b.jpg','2018-08-01 06:00:00','07b4f01b-9ce2-40ab-8e22-c53af2f1621f',0),('d66d1d13-0dce-4c4c-a41e-963f5935eb61','','d66d1d13-0dce-4c4c-a41e-963f5935eb61.jpg','2018-08-01 06:00:00','a2f9c105-9e81-423a-93b0-cb79d9b08827',0),('d77d2d92-aa7a-42ca-8c5c-7b3d3e538603','','d77d2d92-aa7a-42ca-8c5c-7b3d3e538603.jpg','2018-08-01 06:00:00','21d36b97-6ce5-4add-b16b-fe236a552589',0),('d80b9cc6-c5d1-4ace-9197-b20ac671624f','','d80b9cc6-c5d1-4ace-9197-b20ac671624f.jpg','2018-08-01 06:00:00','d01ff66f-7279-4b6f-8cd6-dcca21c43153',0),('d82f5d84-5c98-4457-a0df-d5dc2c291349','','d82f5d84-5c98-4457-a0df-d5dc2c291349.jpg','2018-08-01 06:00:00','200c6961-b5e9-4121-a777-29e9aae8362b',0),('d9a06e78-4338-43e0-9bcd-07566f153f63','','d9a06e78-4338-43e0-9bcd-07566f153f63.jpg','2018-08-01 06:00:00','bb213556-db0b-417e-846b-9df9f23ab311',0),('d9f77df0-0e21-423a-b6bb-4f683bdf123e','','d9f77df0-0e21-423a-b6bb-4f683bdf123e.jpg','2018-08-01 06:00:00','df48e4c2-b5ec-4f46-94d0-11a4dd505790',0),('da345af2-6d54-413d-a6c5-d0e6654592b7','','da345af2-6d54-413d-a6c5-d0e6654592b7.jpg','2018-08-01 06:00:00','bbde5509-04ce-425d-988f-64ee955d76b3',0),('da8081cf-75d7-4180-a96c-5f1ad8853d47','','da8081cf-75d7-4180-a96c-5f1ad8853d47.jpg','2018-08-01 06:00:00','68bde092-05e4-426a-84ee-e187320edcd3',0),('db2bba26-d9e4-461f-bc53-9008cc8ecc88','','db2bba26-d9e4-461f-bc53-9008cc8ecc88.jpg','2018-08-01 06:00:00','1f661943-af65-485a-83d3-990fb1828898',0),('db5f7de6-d94d-4246-a951-eb53d56570c5','','db5f7de6-d94d-4246-a951-eb53d56570c5.jpg','2018-08-01 06:00:00','d01ff66f-7279-4b6f-8cd6-dcca21c43153',0),('dc0ca77d-e941-40c9-ae17-11ee08e200ed','','dc0ca77d-e941-40c9-ae17-11ee08e200ed.jpg','2018-08-01 06:00:00','db06ccea-24c0-45ff-bd45-7afc37761be7',0),('dc344d6d-1162-4c2d-bd32-73745b785615','','dc344d6d-1162-4c2d-bd32-73745b785615.jpg','2018-08-01 06:00:00','b86cf34f-85e8-48f4-a52c-8dfbf33627e1',0),('dc9a5968-3c42-431a-a60c-81819c49f555','','dc9a5968-3c42-431a-a60c-81819c49f555.jpg','2018-08-01 06:00:00','9c7bda77-02bd-4ebe-a46a-d12580607946',0),('dcdf147c-b588-4d59-a50f-a50b13ccfd77','','dcdf147c-b588-4d59-a50f-a50b13ccfd77.jpg','2018-08-01 06:00:00','c36abd43-fde7-4ea6-bcc4-4cedad5b3b47',0),('dd22011d-03ea-4a81-9076-0800f46345d5','','dd22011d-03ea-4a81-9076-0800f46345d5.jpg','2018-08-01 06:00:00','1efa9baf-30f0-4f0f-b037-988a4bb82d40',0),('dd75efde-5b59-40cf-8f2e-40bf79c77be7','','dd75efde-5b59-40cf-8f2e-40bf79c77be7.jpg','2018-08-01 06:00:00','ed4577eb-f7ef-4e52-bffb-b9a3dda94b76',0),('de3d5929-89a7-4090-8396-b368b2c0f013','','de3d5929-89a7-4090-8396-b368b2c0f013.jpg','2018-08-01 06:00:00','21d36b97-6ce5-4add-b16b-fe236a552589',0),('deaa734f-0246-4b4a-ac6a-3eb922364076','','deaa734f-0246-4b4a-ac6a-3eb922364076.jpg','2018-08-01 06:00:00','aa0d2e22-5d9d-4062-93e2-ca490adf26a3',0),('decf4cd0-3446-417e-bc43-7d8293981ad1','','decf4cd0-3446-417e-bc43-7d8293981ad1.jpg','2018-08-01 06:00:00','7bd3baf5-b203-46b5-83f6-3f250a24e442',0),('df43212a-c6a0-44f8-9f1e-c08bf74180ca','','df43212a-c6a0-44f8-9f1e-c08bf74180ca.jpg','2018-08-01 06:00:00','79efb33b-e2bb-4489-a6c3-8888d620a383',0),('e09e9877-5212-4e48-9a2d-8a287da3f9a5','','e09e9877-5212-4e48-9a2d-8a287da3f9a5.jpg','2018-08-01 06:00:00','9ad94bb1-590d-412d-a87b-3799fd555f72',0),('e0c1194a-c421-42c1-ae1d-bec4fd9993e3','','e0c1194a-c421-42c1-ae1d-bec4fd9993e3.jpg','2018-08-01 06:00:00','23da570e-81bd-4a21-9139-f3844760273f',0),('e10ce605-3eba-478d-9d94-b690f7fca1d9','','e10ce605-3eba-478d-9d94-b690f7fca1d9.jpg','2018-08-01 06:00:00','df5b83ce-9bc1-425c-9c4c-10bcf7eed16d',0),('e12ac6c6-e1bc-4476-80bd-801a213876f5','','e12ac6c6-e1bc-4476-80bd-801a213876f5.jpg','2018-08-01 06:00:00','cb02e90e-0de9-4259-a1b1-a62a45274809',0),('e28e5652-a7ff-4de6-82bd-7ba4d9812b49','','e28e5652-a7ff-4de6-82bd-7ba4d9812b49.jpg','2018-08-01 06:00:00','9d995fc6-d71c-45ec-9dce-6bd94c39a429',0),('e31a681d-baa1-4988-bfd5-ade80fa10dca','','e31a681d-baa1-4988-bfd5-ade80fa10dca.jpg','2018-08-01 06:00:00','c723f764-e89f-4d36-baa2-8edf8a60f3dc',0),('e36374f9-d8f6-4d19-b980-29869272fe74','','e36374f9-d8f6-4d19-b980-29869272fe74.jpg','2018-08-01 06:00:00','81fd68e8-cb6e-4578-bf32-3ce2ff659791',0),('e4b8bc25-ec2b-4415-840c-3bb1e33f9ac0','','e4b8bc25-ec2b-4415-840c-3bb1e33f9ac0.jpg','2018-08-01 06:00:00','2808966e-488d-46bb-a2db-05129d12e2af',0),('e56c626e-48d8-4144-87f7-9024f00d2cdf','','e56c626e-48d8-4144-87f7-9024f00d2cdf.jpg','2018-08-01 06:00:00','9b85468e-a336-4049-924c-e7278d6de58e',0),('e9b16085-717b-437a-bbe1-4bad129eef55','','e9b16085-717b-437a-bbe1-4bad129eef55.jpg','2018-08-01 06:00:00','bba3a2bc-fc9f-4a5a-ace2-8c8c6b3569da',0),('ea44b923-4173-4f81-8961-c37ff95b62f8','','ea44b923-4173-4f81-8961-c37ff95b62f8.jpg','2018-08-01 06:00:00','81fd68e8-cb6e-4578-bf32-3ce2ff659791',0),('ebbbc5fb-7d82-4499-8b98-5b2ea68a68fc','','ebbbc5fb-7d82-4499-8b98-5b2ea68a68fc.jpg','2018-08-01 06:00:00','c723f764-e89f-4d36-baa2-8edf8a60f3dc',0),('ebf3b364-20aa-4c3a-be0a-245fe542a2cf','','ebf3b364-20aa-4c3a-be0a-245fe542a2cf.jpg','2018-08-01 06:00:00','0c9d4458-a0ff-4ac7-8c8b-5fd4a3e6f753',0),('ec39a7d3-0e5f-40a1-be8e-9ae02c87de36','','ec39a7d3-0e5f-40a1-be8e-9ae02c87de36.jpg','2018-08-01 06:00:00','f69370d6-baca-4748-8d0f-5a58ab18e7b8',0),('ec6151d6-164b-4a33-a4d1-1de0efe3b55f','','ec6151d6-164b-4a33-a4d1-1de0efe3b55f.jpg','2018-08-01 06:00:00','b00c9ddf-d323-4f6b-a27f-cde42017885c',0),('ec6c20aa-b7be-4394-a3fb-34091bd2ee81','','ec6c20aa-b7be-4394-a3fb-34091bd2ee81.jpg','2018-08-01 06:00:00','a2351284-d537-41a8-aa39-cac654a19874',0),('ed4f3466-a6c7-4ac1-b167-3e5ccd47d629','','ed4f3466-a6c7-4ac1-b167-3e5ccd47d629.jpg','2018-08-01 06:00:00','dd27cbc9-4be4-480c-85ac-67eba7f95660',0),('ee1a2952-0ffb-428c-8f0d-4794f6b620b1','','ee1a2952-0ffb-428c-8f0d-4794f6b620b1.jpg','2018-08-01 06:00:00','b9505a0f-65a2-48e9-9628-43d8ec06a3b5',0),('ee891da7-6702-46d6-97e8-91232e4a4a6f','','ee891da7-6702-46d6-97e8-91232e4a4a6f.jpg','2018-08-01 06:00:00','2b6363dd-eb79-49f9-a47e-d01ac8c2df7b',0),('eec30527-4564-4e3b-9363-cd23d300e777','','eec30527-4564-4e3b-9363-cd23d300e777.jpg','2018-08-01 06:00:00','5035d7f3-3c35-44bc-8d77-cb3e8090daf7',0),('f14200bf-c3cb-427c-9b21-f324af7830c5','','f14200bf-c3cb-427c-9b21-f324af7830c5.jpg','2018-08-01 06:00:00','df48e4c2-b5ec-4f46-94d0-11a4dd505790',0),('f1a8be97-f9a4-46e8-b4dd-b3ac7b523928','','f1a8be97-f9a4-46e8-b4dd-b3ac7b523928.jpg','2018-08-01 06:00:00','31eba55d-9c1d-4558-9d6f-2125c9561303',0),('f214e6f1-7707-4de7-a49f-9c538d2324e8','','f214e6f1-7707-4de7-a49f-9c538d2324e8.jpg','2018-08-01 06:00:00','25e5260f-0302-4db4-b584-d40611981423',0),('f2d89b94-5263-45ae-b2c4-d9f56d876139','','f2d89b94-5263-45ae-b2c4-d9f56d876139.jpg','2018-08-01 06:00:00','8d337c03-93ce-4379-8782-f7c943bc972e',0),('f34af84e-c388-4f0b-bb08-25595163e946','','f34af84e-c388-4f0b-bb08-25595163e946.jpg','2018-08-01 06:00:00','56f988b3-7d67-4fb7-ba7f-6dec92662174',0),('f3964dbb-2952-40f6-9e05-bc8b2cb110ff','','f3964dbb-2952-40f6-9e05-bc8b2cb110ff.jpg','2018-08-01 06:00:00','2808966e-488d-46bb-a2db-05129d12e2af',0),('f3a8bca3-e415-4194-ae43-4e96a96315ce','','f3a8bca3-e415-4194-ae43-4e96a96315ce.jpg','2018-08-01 06:00:00','e46908cd-055c-473e-8045-600d4f564263',0),('f3bd58c8-5e96-47c9-9957-124f25d407c2','','f3bd58c8-5e96-47c9-9957-124f25d407c2.jpg','2018-08-01 06:00:00','23da570e-81bd-4a21-9139-f3844760273f',0),('f3dcc02e-12c0-4581-9315-4fcb078d5d88','','f3dcc02e-12c0-4581-9315-4fcb078d5d88.jpg','2018-08-01 06:00:00','d01ff66f-7279-4b6f-8cd6-dcca21c43153',0),('f3f4db5f-04c6-48f4-bc45-a5771c01ba50','','f3f4db5f-04c6-48f4-bc45-a5771c01ba50.jpg','2018-08-01 06:00:00','0b3bb7cc-23b7-46a6-b691-fbfbbfa2a29f',0),('f4ef7fd6-366c-4ace-ac56-6333020e0f2b','','f4ef7fd6-366c-4ace-ac56-6333020e0f2b.jpg','2018-08-01 06:00:00','79efb33b-e2bb-4489-a6c3-8888d620a383',0),('f762a372-4c1d-457c-bf1a-3d97a876f0e8','','f762a372-4c1d-457c-bf1a-3d97a876f0e8.jpg','2018-08-01 06:00:00','b00c9ddf-d323-4f6b-a27f-cde42017885c',0),('f778e65b-5130-4c8a-8486-cfd6a0d80501','','f778e65b-5130-4c8a-8486-cfd6a0d80501.jpg','2018-08-01 06:00:00','28c688d8-43e6-44a4-ba27-ec3254d41c31',0),('f7848022-6987-405c-a387-392f5187d82e','','f7848022-6987-405c-a387-392f5187d82e.jpg','2018-08-01 06:00:00','001c4ff5-d21b-4b95-8760-9589d9fdc4bd',0),('f836ad66-897d-418c-a2c8-fef81fa576c7','','f836ad66-897d-418c-a2c8-fef81fa576c7.jpg','2018-08-01 06:00:00','f99dfaee-5985-48b8-9967-16f99b89dd67',0),('fa9de479-6de6-40b9-a0c9-1d1f214991b5','','fa9de479-6de6-40b9-a0c9-1d1f214991b5.jpg','2018-08-01 06:00:00','6e157876-eda4-414a-976b-481976e38042',0),('fb51fdcf-9c5e-4fcf-94e6-ee97bad9e73f','','fb51fdcf-9c5e-4fcf-94e6-ee97bad9e73f.jpg','2018-08-01 06:00:00','2b6363dd-eb79-49f9-a47e-d01ac8c2df7b',0),('fb5d45ae-e6e5-4b61-bc9e-f795843fce98','','fb5d45ae-e6e5-4b61-bc9e-f795843fce98.jpg','2018-08-01 06:00:00','3bb3720c-2d8b-4b09-9840-922481502c2e',0),('fbee2493-5dc9-4ca4-a6c3-503d503229a2','','fbee2493-5dc9-4ca4-a6c3-503d503229a2.jpg','2018-08-01 06:00:00','a93db687-aeae-4966-829f-db55955bf180',0),('fbee63a6-e582-4f5b-b74b-060775e5467d','','fbee63a6-e582-4f5b-b74b-060775e5467d.jpg','2018-08-01 06:00:00','c36abd43-fde7-4ea6-bcc4-4cedad5b3b47',0),('fc4a83f3-7bad-4350-8771-ff346305aeb5','','fc4a83f3-7bad-4350-8771-ff346305aeb5.jpg','2018-08-01 06:00:00','df5b83ce-9bc1-425c-9c4c-10bcf7eed16d',0),('feeb8233-5d38-4359-8d7d-b15698ae6df9','','feeb8233-5d38-4359-8d7d-b15698ae6df9.jpg','2018-08-01 06:00:00','f99dfaee-5985-48b8-9967-16f99b89dd67',0),('ff0a1896-6f46-4c12-b5cf-a9e0b7dbb130','','ff0a1896-6f46-4c12-b5cf-a9e0b7dbb130.jpg','2018-08-01 06:00:00','3bb3720c-2d8b-4b09-9840-922481502c2e',0),('ffd74801-92ab-4a14-a6ef-7b3bd37e43ea','','ffd74801-92ab-4a14-a6ef-7b3bd37e43ea.jpg','2018-08-01 06:00:00','0760d51f-74fc-47a8-bda8-614c646cb202',0),('ffe2c44b-e267-47b7-b6c3-e20590d7787a','','ffe2c44b-e267-47b7-b6c3-e20590d7787a.jpg','2018-08-01 06:00:00','3e5e06dc-7603-46e1-89f7-c4aaaadfd873',0);
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
INSERT INTO `dbur_local_ubicaciones` VALUES ('0704a77c-c3c0-4a6b-865d-96fc2b286c2f','prueba1','4846a4bd-4f1a-485b-aef7-732089c28a4e','a9cbbbb4-798d-493d-98b6-b8587ec49d6a'),('89b0ae41-1fba-43e6-83e3-51b9fcbc66d9','Mesa 4','4846a4bd-4f1a-485b-aef7-732089c28a4e','a9cbbbb4-798d-493d-98b6-b8587ec49d6a'),('9240569e-9b46-4395-a785-45f5fe49cb46','Mesa 5','4846a4bd-4f1a-485b-aef7-732089c28a4e','a9cbbbb4-798d-493d-98b6-b8587ec49d6a'),('92ed013a-0397-4e3d-82f6-a3de5bc10f9a','Mesa 1','4846a4bd-4f1a-485b-aef7-732089c28a4e','a9cbbbb4-798d-493d-98b6-b8587ec49d6a'),('af7fd984-57a1-4ea9-9ccb-496d7d09e36a','Mesa 3','4846a4bd-4f1a-485b-aef7-732089c28a4e','a9cbbbb4-798d-493d-98b6-b8587ec49d6a'),('dbeb3421-e5f0-4e4e-939e-73f37ea9079e','Mesa 2','4846a4bd-4f1a-485b-aef7-732089c28a4e','a9cbbbb4-798d-493d-98b6-b8587ec49d6a'),('dc66e15f-beb5-4f73-9ff9-bd9366bef9c1','Mesa 6','4846a4bd-4f1a-485b-aef7-732089c28a4e','a9cbbbb4-798d-493d-98b6-b8587ec49d6a');
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
INSERT INTO `dbur_personas` VALUES ('001c4ff5-d21b-4b95-8760-9589d9fdc4bd','Silvia Alejandrina','Castro Figueroa',NULL,NULL,NULL,NULL,'2018-08-01',0),('00ce4564-bbeb-431a-a2c4-57513a59fe86','Mariano Dagoberto','Blanco Rodriguez',NULL,NULL,NULL,NULL,'2018-08-01',0),('02569d11-806b-4413-8fc5-9b721dbb39e4','Manuel Orlando','Cabrera Candray',NULL,NULL,NULL,NULL,'2018-08-01',0),('04805d00-1684-4c76-81e0-993fcb1ba841','Hortensia Margarita','Lopez Quintana',NULL,NULL,NULL,NULL,'2018-08-01',0),('0760d51f-74fc-47a8-bda8-614c646cb202','Rodrigo','Ramirez',NULL,NULL,NULL,NULL,'2018-08-01',0),('07b4f01b-9ce2-40ab-8e22-c53af2f1621f','Jose Javier','Palomo Nieto',NULL,NULL,NULL,NULL,'2018-08-01',0),('0a1c779e-4edb-4e57-baff-17f4832f0201','Rosa Alma','Cruz Marinero',NULL,NULL,NULL,NULL,'2018-08-01',0),('0b3bb7cc-23b7-46a6-b691-fbfbbfa2a29f','Jorge Luis','Rosales Rios',NULL,NULL,NULL,NULL,'2018-08-01',0),('0c9d4458-a0ff-4ac7-8c8b-5fd4a3e6f753','Juan Carlos','Mendoza Portillo',NULL,NULL,NULL,NULL,'2018-08-01',0),('1014831b-c347-4265-966c-f593cc93346b','Mauricio Roberto','Linares Ramirez',NULL,NULL,NULL,NULL,'2018-08-01',0),('12270ac6-b298-4dd1-a009-8e7f4cdb6100','Bonner Francisco','Jimenez Belloso',NULL,NULL,NULL,NULL,'2018-08-01',0),('16deee0d-2b87-4787-baff-c6c6d42af457','Osiris','Luna Meza',NULL,NULL,NULL,NULL,'2018-08-01',0),('1efa9baf-30f0-4f0f-b037-988a4bb82d40','Manuel Rigoberto','Soto Lazo',NULL,NULL,NULL,NULL,'2018-08-01',0),('1f661943-af65-485a-83d3-990fb1828898','Milton Ricardo','Ramirez Garay',NULL,NULL,NULL,NULL,'2018-08-01',0),('200c6961-b5e9-4121-a777-29e9aae8362b','Ernesto','Echeverria',NULL,NULL,NULL,NULL,'2018-08-01',0),('21b76b9b-23bf-4eb3-b68a-28f8192fba55','Maria Marta Concepcion','Valladares Mendoza',NULL,NULL,NULL,NULL,'2018-08-01',0),('21d36b97-6ce5-4add-b16b-fe236a552589','Marta Evelyn','Batres Araujo',NULL,NULL,NULL,NULL,'2018-08-01',0),('23da570e-81bd-4a21-9139-f3844760273f','Norma Guisela','Herrera de Portillo',NULL,NULL,NULL,NULL,'2018-08-01',0),('25e5260f-0302-4db4-b584-d40611981423','Guillermo Antonio','Gallegos Navarrete',NULL,NULL,NULL,NULL,'2018-08-01',0),('2808966e-488d-46bb-a2db-05129d12e2af','Rene Alfredo','Portillo Cuadra',NULL,NULL,NULL,NULL,'2018-08-01',0),('28c688d8-43e6-44a4-ba27-ec3254d41c31','Lorenzo','Rivas Echeverria',NULL,NULL,NULL,NULL,'2018-08-01',0),('2b6363dd-eb79-49f9-a47e-d01ac8c2df7b','Carmen Milena','Mayorga Valera',NULL,NULL,NULL,NULL,'2018-08-01',0),('2bb6e241-4b2d-4f16-94a6-94b614302d30','Francisco Jose','Zablah Safie',NULL,NULL,NULL,NULL,'2018-08-01',0),('2fa00bb1-c852-46cc-bdaf-95e931a79376','Marcela Guadalupe','Villatoro Alvarado',NULL,NULL,NULL,NULL,'2018-08-01',0),('31eba55d-9c1d-4558-9d6f-2125c9561303','Jose Andres','Hernandez Ventura',NULL,NULL,NULL,NULL,'2018-08-01',0),('3353d23e-b6d8-4d98-81c6-1d3e74f09228','Jose Edgar','Escolan Batarse',NULL,NULL,NULL,NULL,'2018-08-01',0),('33622644-09a4-43e3-b3f6-a272fc92e43f','Ana Maria Margarita','Escobar Lopez',NULL,NULL,NULL,NULL,'2018-08-01',0),('3533bed2-a00d-4df6-a126-e7a07bbf632b','Javier Antonio','Valdez Castillo',NULL,NULL,NULL,NULL,'2018-08-01',0),('378154ae-28e2-48a4-8aff-fcbd1ca4b4aa','Karina Ivette','Sosa de Rodas',NULL,NULL,NULL,NULL,'2018-08-01',0),('37c31ec4-25d3-48e1-884d-b15c14d7e4da','Rick','Cubias',NULL,NULL,NULL,NULL,'2018-08-01',0),('3bb3720c-2d8b-4b09-9840-922481502c2e','Daniel','Vasquez',NULL,NULL,NULL,NULL,'2018-08-01',0),('3e5e06dc-7603-46e1-89f7-c4aaaadfd873','Arturo Simeon','Magana Azmitia',NULL,NULL,NULL,NULL,'2018-08-01',0),('4281f040-6885-41ab-b431-e38b2a9bc975','Karina','Castillo',NULL,NULL,NULL,NULL,'2018-08-01',0),('48683ae8-b354-4857-88b8-aef7e29bb0d5','Carlos Armando','Reyes Ramos',NULL,NULL,NULL,NULL,'2018-08-01',0),('4fc25eae-9ead-4b5b-bbee-9ca5f2473c5a','Ana Lucia','Baires de Martinez',NULL,NULL,NULL,NULL,'2018-08-01',0),('5035d7f3-3c35-44bc-8d77-cb3e8090daf7','Patricia Elena','Valdivieso de Gallardo',NULL,NULL,NULL,NULL,'2018-08-01',0),('55dd8a94-ef1f-4694-aa66-3d54eb34ee97','Magda','Umanzor ',NULL,NULL,NULL,NULL,'2018-08-01',0),('56f988b3-7d67-4fb7-ba7f-6dec92662174','Norma Cristina','Cornejo Amaya',NULL,NULL,NULL,NULL,'2018-08-01',0),('63e04470-f0a1-4a59-a79d-f755b4e56144','Palomo 2','Roberto 2',NULL,NULL,NULL,NULL,'2018-08-01',0),('68bde092-05e4-426a-84ee-e187320edcd3','Reina','Romero',NULL,NULL,NULL,NULL,'2018-08-01',0),('69af06f9-8a81-49f7-9f73-0bcc74de4b0d','Eeileen Auxiliadora','Romero Valle',NULL,NULL,NULL,NULL,'2018-08-01',0),('6b5c8cb1-14fd-4afe-93ab-515acaadac8e','Ricardo Andres','Velasquez Parker',NULL,NULL,NULL,NULL,'2018-08-01',0),('6e157876-eda4-414a-976b-481976e38042','Jaime Orlando','Sandoval Leiva',NULL,NULL,NULL,NULL,'2018-08-01',0),('6e2ae45e-629e-4340-92bd-1a0f52ed84c1','Tomas Emilio','Corea Fuentes',NULL,NULL,NULL,NULL,'2018-08-01',0),('72327744-1679-4e01-a3cb-611a614c3fdd','Rodolfo Antonio','Parker Soto',NULL,NULL,NULL,NULL,'2018-08-01',0),('77916913-0046-449e-a17f-b9a1073c8304','prueba1','prueba1','prueba1',NULL,NULL,NULL,'2018-08-13',0),('79a7e361-90ed-49a1-aa40-5b3a492445ab','Mauricio Ernesto','Vargas Valdez',NULL,NULL,NULL,NULL,'2018-08-01',0),('79efb33b-e2bb-4489-a6c3-8888d620a383','Yanci Guadalupe','Urbina Gonzalez',NULL,NULL,NULL,NULL,'2018-08-01',0),('7bd3baf5-b203-46b5-83f6-3f250a24e442','Juan Manuel de Jesus','Flores Cornejo',NULL,NULL,NULL,NULL,'2018-08-01',0),('7c1d8c33-8fd1-4f9f-baf3-c9e6eb9cd03b','Numan Pompilio','Salgado Garcia',NULL,NULL,NULL,NULL,'2018-08-01',0),('81fd68e8-cb6e-4578-bf32-3ce2ff659791','Jorge Adalberto Josue','Godoy Cardoza',NULL,NULL,NULL,NULL,'2018-08-01',0),('85abe0b5-279f-47c3-8ff3-1b6fea2372a1','Maria Elizabeth','Gomez Perla',NULL,NULL,NULL,NULL,'2018-08-01',0),('87857636-14d0-45dc-870f-eb442f8b0822','Omar','Egan',NULL,NULL,NULL,NULL,'2018-08-01',0),('8d337c03-93ce-4379-8782-f7c943bc972e','Karla Elena','Hernandez Molina',NULL,NULL,NULL,NULL,'2018-08-01',0),('8e1eaec4-f577-4a61-a163-7136e0eab0e8','Jose Francisco','Merino Lopez',NULL,NULL,NULL,NULL,'2018-08-01',0),('926831bc-6890-4e5b-a562-9683cb3051a1','Dina Yamileth','Argueta Avelar',NULL,NULL,NULL,NULL,'2018-08-01',0),('93954631-3d1b-47d8-8881-75d93cbc8dd1','Catalino Antonio','Castillo Argueta',NULL,NULL,NULL,NULL,'2018-08-01',0),('962e5c40-a931-4616-b6d3-8662e370305c','Reinaldo Alcides','Carballo Carballo',NULL,NULL,NULL,NULL,'2018-08-01',0),('991d26c6-a462-4ef5-9683-4d6f279ebd34','Mario Antonio','Ponce Lopez',NULL,NULL,NULL,NULL,'2018-08-01',0),('9ad94bb1-590d-412d-a87b-3799fd555f72','Alberto Armando','Romero Rodriguez','',NULL,NULL,NULL,'2018-08-01',0),('9b85468e-a336-4049-924c-e7278d6de58e','Raul','Beltrhan',NULL,NULL,NULL,NULL,'2018-08-01',0),('9c7bda77-02bd-4ebe-a46a-d12580607946','Rina Idalia','Araujo de Martinez',NULL,NULL,NULL,NULL,'2018-08-01',0),('9d995fc6-d71c-45ec-9dce-6bd94c39a429','Reynaldo Antonio','Lopez Cardoza',NULL,NULL,NULL,NULL,'2018-08-01',0),('a10f368a-94c8-4866-8649-dd47901e8d38','Audelia Guadalupe','Lopez de Kleutgens',NULL,NULL,NULL,NULL,'2018-08-01',0),('a2351284-d537-41a8-aa39-cac654a19874','Luis Roberto','Angulo Samayoa',NULL,NULL,NULL,NULL,'2018-08-01',0),('a2f9c105-9e81-423a-93b0-cb79d9b08827','Rosa Maria','Romero',NULL,NULL,NULL,NULL,'2018-08-01',0),('a93db687-aeae-4966-829f-db55955bf180','Mario Alberto','Tenorio Guerrero',NULL,NULL,NULL,NULL,'2018-08-01',0),('aa0d2e22-5d9d-4062-93e2-ca490adf26a3','Jose Serafin','Orantes Rodriguez',NULL,NULL,NULL,NULL,'2018-08-01',0),('b00c9ddf-d323-4f6b-a27f-cde42017885c','Norman Noel','Quijano Gonzalez',NULL,NULL,NULL,NULL,'2018-08-01',0),('b463b9ee-6bf6-4b80-933e-9bd6f9cadc8b','David Ernesto','Reyes Molina',NULL,NULL,NULL,NULL,'2018-08-01',0),('b86cf34f-85e8-48f4-a52c-8dfbf33627e1','Jorge Schafik','Handal Vega Silva',NULL,NULL,NULL,NULL,'2018-08-01',0),('b9505a0f-65a2-48e9-9628-43d8ec06a3b5','Yolanda Anabel','Belloso Salazar',NULL,NULL,NULL,NULL,'2018-08-01',0),('bb213556-db0b-417e-846b-9df9f23ab311','Rodolfo Antonio','Martinez',NULL,NULL,NULL,NULL,'2018-08-01',0),('bba3a2bc-fc9f-4a5a-ace2-8c8c6b3569da','Rene','Bautista',NULL,NULL,NULL,NULL,'2018-08-01',0),('bbde5509-04ce-425d-988f-64ee955d76b3','Juan Jose','Martel',NULL,NULL,NULL,NULL,'2018-08-01',0),('bc607b55-757c-4aa0-a329-6e072f6f4f7b','Rodrigo','Avila Aviles',NULL,NULL,NULL,NULL,'2018-08-01',0),('c0a382e3-2348-469d-8c83-9f1b20f7f53f','Conchi','Desconocido',NULL,NULL,NULL,NULL,'2018-08-01',0),('c36abd43-fde7-4ea6-bcc4-4cedad5b3b47','Felissa Guadalupe','Cristales Miranda',NULL,NULL,NULL,NULL,'2018-08-01',0),('c723f764-e89f-4d36-baa2-8edf8a60f3dc','Santos Adelmo','Rivas Rivas',NULL,NULL,NULL,NULL,'2018-08-01',0),('c7b685e3-f567-45c4-8ebc-ddf1d84402fe','Donato Eugenio','Vaquerano Rivas',NULL,NULL,NULL,NULL,'2018-08-01',0),('c9fecc3a-5120-4e58-a193-bd6cf7df40fe','Ricardo Ernesto','Godoy Penate',NULL,NULL,NULL,NULL,'2018-08-01',0),('cb02e90e-0de9-4259-a1b1-a62a45274809','Mario Marroquin','Mejia',NULL,NULL,NULL,NULL,'2018-08-01',0),('ccb4a979-cbdf-4d23-bd0a-efd251284388','Carlos Alberto','Garcia Ruiz',NULL,NULL,NULL,NULL,'2018-08-01',0),('cd1b4ce9-38d1-4dde-a193-ae1a2c561ee1','Jose Luis','Urias',NULL,NULL,NULL,NULL,'2018-08-01',0),('d01ff66f-7279-4b6f-8cd6-dcca21c43153','Alisson','Mena',NULL,NULL,NULL,NULL,'2018-08-01',0),('d33c6a9a-0bd9-4288-b335-4d6519169111','Cesar','Lima',NULL,NULL,NULL,NULL,'2018-08-01',0),('d62904ca-ce06-4b8b-9127-e80acaf7bdf8','Mardo','Carranza ',NULL,NULL,NULL,NULL,'2018-08-01',0),('db06ccea-24c0-45ff-bd45-7afc37761be7','Silvia Estela','Ostorga de Escobar',NULL,NULL,NULL,NULL,'2018-08-01',0),('dd27cbc9-4be4-480c-85ac-67eba7f95660','Jose Antonio','Almendariz Rivas',NULL,NULL,NULL,NULL,'2018-08-01',0),('dd468fce-e477-448a-985a-e2ecb6cf02ef','Daniel Alcides','Reyes Rubio',NULL,NULL,NULL,NULL,'2018-08-01',0),('df48e4c2-b5ec-4f46-94d0-11a4dd505790','Jose Mauricio','Rivera',NULL,NULL,NULL,NULL,'2018-08-01',0),('df5b83ce-9bc1-425c-9c4c-10bcf7eed16d','Heinrich','Sanchez',NULL,NULL,NULL,NULL,'2018-08-01',0),('e46908cd-055c-473e-8045-600d4f564263','Roberto Leonardo','Bonilla Aguilar',NULL,NULL,NULL,NULL,'2018-08-01',0),('ed4577eb-f7ef-4e52-bffb-b9a3dda94b76','Julio Cesar','Fabian Perez',NULL,NULL,NULL,NULL,'2018-08-01',0),('edd10b8b-5fad-41f0-823e-16a0dd20650a','Lucia del Carmen','Ayala de Leon',NULL,NULL,NULL,NULL,'2018-08-01',0),('eef21415-b5d7-400c-83ec-dbc62c91b116','Guadalupe Antonio','Vasquez Martinez',NULL,NULL,NULL,NULL,'2018-08-01',0),('f00573ac-efab-4319-826b-864420982996','Allan','Trejo',NULL,NULL,NULL,NULL,'2018-08-01',0),('f69370d6-baca-4748-8d0f-5a58ab18e7b8','Jorge Uriel','Mazariego Mazariego',NULL,NULL,NULL,NULL,'2018-08-01',0),('f99dfaee-5985-48b8-9967-16f99b89dd67','Ellie','Martinez',NULL,NULL,NULL,NULL,'2018-08-01',0),('fa1ac08f-f427-498d-9578-6885b9a3a172','Rene Gustavo','Escalante Zelaya',NULL,NULL,NULL,NULL,'2018-08-01',0),('ffc2b6b5-111d-429f-a151-d469e484273c','Mario Andres','Martinez Gomez',NULL,NULL,NULL,NULL,'2018-08-01',0),('fff43918-405c-463c-9a67-7192ec3022c7','Maytee Gabriela','Iraheta Escalante',NULL,NULL,NULL,NULL,'2018-08-01',0);
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
INSERT INTO `dbur_restaurantes_sucursales` VALUES ('a9cbbbb4-798d-493d-98b6-b8587ec49d6a','-290836718','Olive Garden La Gran Via','670455879:AAGaUmR7k1NE05Degc6nbmi6VBgkJiuSQhs','2018-08-14',1004);
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
INSERT INTO `dbur_tipos_ubicaciones` VALUES ('4846a4bd-4f1a-485b-aef7-732089c28a4e','Mesa Interior'),('686b329b-661a-4a81-bd35-256c2ed05ead','Mesa Exterior'),('b5d86ec4-5425-425b-95e8-ea512492eab3','Bar');
/*!40000 ALTER TABLE `dbur_tipos_ubicaciones` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-08-17 18:12:52
