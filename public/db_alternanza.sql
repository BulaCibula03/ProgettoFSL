-- MySQL dump 10.13  Distrib 5.7.12, for Win32 (AMD64)
--
-- Host: localhost    Database: datigalilei
-- ------------------------------------------------------
-- Server version	5.7.17-log

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
-- Table structure for table `agenda`
--

DROP TABLE IF EXISTS `agenda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agenda` (
  `idAg` int(11) NOT NULL AUTO_INCREMENT,
  `idAz` int(11) DEFAULT NULL,
  `datae` datetime DEFAULT NULL,
  `tipo` int(11) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `chi` varchar(50) DEFAULT NULL,
  `stato` int(11) DEFAULT NULL,
  `annos` int(11) DEFAULT NULL,
  `altro` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idAg`)
) ENGINE=InnoDB AUTO_INCREMENT=2336 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `agenda_stato`
--

DROP TABLE IF EXISTS `agenda_stato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agenda_stato` (
  `idStato` int(11) NOT NULL AUTO_INCREMENT,
  `descr` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`idStato`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `agenda_tipo`
--

DROP TABLE IF EXISTS `agenda_tipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agenda_tipo` (
  `idT` int(11) NOT NULL AUTO_INCREMENT,
  `descr` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idT`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `attivita`
--

DROP TABLE IF EXISTS `attivita`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attivita` (
  `IDAttivita` int(11) NOT NULL AUTO_INCREMENT,
  `Attivita` varchar(255) DEFAULT NULL,
  `Tipo` varchar(255) DEFAULT NULL,
  `NumOre` int(11) DEFAULT NULL,
  `Referente` varchar(255) DEFAULT NULL,
  `Esterno` bit(1) DEFAULT b'0',
  `Annos` int(11) DEFAULT NULL,
  `Note` varchar(255) DEFAULT NULL,
  `Datai` datetime DEFAULT NULL,
  `Dataf` datetime DEFAULT NULL,
  `IdAz` int(11) DEFAULT NULL,
  `dataPfc` datetime DEFAULT NULL,
  PRIMARY KEY (`IDAttivita`)
) ENGINE=InnoDB AUTO_INCREMENT=1858 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `attivita_staff`
--

DROP TABLE IF EXISTS `attivita_staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attivita_staff` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idAtt` int(11) DEFAULT NULL,
  `idDoc` varchar(16) DEFAULT NULL,
  `NumOre` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=152 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `attivita_studenti`
--

DROP TABLE IF EXISTS `attivita_studenti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attivita_studenti` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IDAttivita` int(11) DEFAULT NULL,
  `IDStudente` varchar(16) DEFAULT NULL,
  `NumOrePres` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `idx_attivta_studenti` (`IDAttivita`,`IDStudente`)
) ENGINE=InnoDB AUTO_INCREMENT=79601 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `attivita_tutor`
--

DROP TABLE IF EXISTS `attivita_tutor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attivita_tutor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idAtt` int(11) DEFAULT NULL,
  `idTut` int(11) DEFAULT NULL,
  `dal` datetime DEFAULT NULL,
  `al` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `azienda`
--

DROP TABLE IF EXISTS `azienda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `azienda` (
  `idAz` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `natura` int(11) DEFAULT NULL,
  `comune_sl` int(11) DEFAULT NULL,
  `indirizzo_sl` varchar(255) DEFAULT NULL,
  `comune` int(11) DEFAULT NULL,
  `indirizzo` varchar(255) DEFAULT NULL,
  `cod_fiscale` varchar(16) DEFAULT NULL,
  `part_iva` varchar(15) DEFAULT NULL,
  `tel` varchar(50) DEFAULT NULL,
  `mail` varchar(255) DEFAULT NULL,
  `sito` varchar(255) DEFAULT NULL,
  `leg_rapp_nome` varchar(255) DEFAULT NULL,
  `leg_rapp_nato_a` int(11) DEFAULT NULL,
  `leg_rapp_dt` datetime DEFAULT NULL,
  `leg_rapp_cf` varchar(16) DEFAULT NULL,
  `leg_tel` varchar(50) DEFAULT NULL,
  `leg_note` varchar(255) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `ateco` varchar(20) DEFAULT NULL,
  `check` bit(1) DEFAULT b'0',
  `nproto` int(11) DEFAULT NULL,
  `dproto` datetime DEFAULT NULL,
  `firma` bit(1) DEFAULT b'0',
  `attiva` bit(1) DEFAULT b'1',
  `prncct` bit(1) DEFAULT b'0',
  `docente` varchar(16) DEFAULT NULL,
  `sportiva` bit(1) DEFAULT b'0',
  `inglese` bit(1) DEFAULT b'0',
  PRIMARY KEY (`idAz`),
  UNIQUE KEY `nome_UNIQUE` (`nome`)
) ENGINE=InnoDB AUTO_INCREMENT=1021 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `azienda_tipo`
--

DROP TABLE IF EXISTS `azienda_tipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `azienda_tipo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `natura` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `comune`
--

DROP TABLE IF EXISTS `comune`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comune` (
  `idComune` int(11) NOT NULL AUTO_INCREMENT,
  `Istat` double DEFAULT NULL,
  `Comune` varchar(120) DEFAULT NULL,
  `Provincia` varchar(2) DEFAULT NULL,
  `Regione` varchar(5) DEFAULT NULL,
  `Prefisso` double DEFAULT NULL,
  `CAP` varchar(6) DEFAULT NULL,
  `CodFisco` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`idComune`)
) ENGINE=InnoDB AUTO_INCREMENT=8305 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `corso`
--

DROP TABLE IF EXISTS `corso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `corso` (
  `idcorso` int(11) NOT NULL AUTO_INCREMENT,
  `idtipo` int(11) DEFAULT NULL,
  `idmodo` int(11) DEFAULT NULL,
  `annos` int(11) DEFAULT NULL,
  `descr` varchar(50) DEFAULT NULL,
  `datai` datetime DEFAULT NULL,
  `dataf` datetime DEFAULT NULL,
  `ore` int(11) DEFAULT NULL,
  `docente` varchar(16) DEFAULT NULL,
  `esterno` bit(1) DEFAULT b'0',
  `note` varchar(80) DEFAULT NULL,
  `enteEsterno` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idcorso`)
) ENGINE=InnoDB AUTO_INCREMENT=327 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `corso_iscritti`
--

DROP TABLE IF EXISTS `corso_iscritti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `corso_iscritti` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idcorso` int(11) DEFAULT NULL,
  `idiscritto` varchar(16) DEFAULT NULL,
  `orepres` int(11) DEFAULT NULL,
  `superato` bit(1) DEFAULT b'0',
  `supplettivo` bit(1) DEFAULT b'0',
  `voto` tinyint(4) DEFAULT NULL,
  `datac` datetime DEFAULT NULL,
  `numero` varchar(255) DEFAULT NULL,
  `firma` bit(1) DEFAULT b'0',
  `notifica` bit(1) DEFAULT b'0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9307 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `corso_modo`
--

DROP TABLE IF EXISTS `corso_modo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `corso_modo` (
  `idmodo` int(11) NOT NULL AUTO_INCREMENT,
  `descr` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idmodo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `corso_tipo`
--

DROP TABLE IF EXISTS `corso_tipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `corso_tipo` (
  `idtipo` int(11) NOT NULL AUTO_INCREMENT,
  `descr` varchar(50) DEFAULT NULL,
  `ore` int(11) DEFAULT NULL,
  PRIMARY KEY (`idtipo`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `docente`
--

DROP TABLE IF EXISTS `docente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `docente` (
  `n` int(11) NOT NULL AUTO_INCREMENT,
  `nominativo` varchar(80) DEFAULT NULL,
  `datan` datetime DEFAULT NULL,
  `luogo` varchar(120) DEFAULT NULL,
  `cf` varchar(16) DEFAULT NULL,
  `indirizzo` varchar(255) DEFAULT NULL,
  `mail` varchar(50) DEFAULT NULL,
  `cell` varchar(15) DEFAULT NULL,
  `esterno` bit(1) DEFAULT b'0',
  `ente` varchar(255) DEFAULT NULL,
  `tipo` int(11) DEFAULT '0',
  PRIMARY KEY (`n`)
) ENGINE=InnoDB AUTO_INCREMENT=830 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `docente_tipo`
--

DROP TABLE IF EXISTS `docente_tipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `docente_tipo` (
  `idD` int(11) NOT NULL,
  `tipo` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`idD`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `firma`
--

DROP TABLE IF EXISTS `firma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `firma` (
  `annos` int(11) NOT NULL,
  `dirigente` varchar(80) NOT NULL,
  `assicurazione` varchar(40) NOT NULL,
  PRIMARY KEY (`annos`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `qclasse`
--

DROP TABLE IF EXISTS `qclasse`;
/*!50001 DROP VIEW IF EXISTS `qclasse`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `qclasse` AS SELECT 
 1 AS `anno`,
 1 AS `classe`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `qcommessa`
--

DROP TABLE IF EXISTS `qcommessa`;
/*!50001 DROP VIEW IF EXISTS `qcommessa`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `qcommessa` AS SELECT 
 1 AS `IDAttivita`,
 1 AS `Attivita`,
 1 AS `Referente`,
 1 AS `Annos`,
 1 AS `Note`,
 1 AS `Datai`,
 1 AS `Dataf`,
 1 AS `nome`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `qcommessastudenti`
--

DROP TABLE IF EXISTS `qcommessastudenti`;
/*!50001 DROP VIEW IF EXISTS `qcommessastudenti`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `qcommessastudenti` AS SELECT 
 1 AS `IDAttivita`,
 1 AS `studente`,
 1 AS `NumOrePres`,
 1 AS `classe`,
 1 AS `anno`,
 1 AS `specializz`,
 1 AS `codf_st`,
 1 AS `Attivita`,
 1 AS `Annos`,
 1 AS `Annos1`,
 1 AS `Datai`,
 1 AS `Dataf`,
 1 AS `NumOre`,
 1 AS `dataPfc`,
 1 AS `nomeaz`,
 1 AS `part_iva`,
 1 AS `dproto`,
 1 AS `nproto`,
 1 AS `indirizzo_sl`,
 1 AS `Comune`,
 1 AS `Provincia`,
 1 AS `CAP`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `qconvenzione`
--

DROP TABLE IF EXISTS `qconvenzione`;
/*!50001 DROP VIEW IF EXISTS `qconvenzione`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `qconvenzione` AS SELECT 
 1 AS `nome`,
 1 AS `natura`,
 1 AS `Comune`,
 1 AS `Provincia`,
 1 AS `CAP`,
 1 AS `indirizzo_sl`,
 1 AS `cod_fiscale`,
 1 AS `part_iva`,
 1 AS `leg_rapp_nome`,
 1 AS `leg_comune`,
 1 AS `leg_pr`,
 1 AS `leg_cap`,
 1 AS `leg_rapp_dt`,
 1 AS `leg_rapp_cf`,
 1 AS `nproto`,
 1 AS `dproto`,
 1 AS `idAz`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `qcorsocertificati`
--

DROP TABLE IF EXISTS `qcorsocertificati`;
/*!50001 DROP VIEW IF EXISTS `qcorsocertificati`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `qcorsocertificati` AS SELECT 
 1 AS `COGNOME`,
 1 AS `NOME`,
 1 AS `CODICE FISCALE`,
 1 AS `LUOGO DI NASCITA`,
 1 AS `DATA DI NASCITA`,
 1 AS `PROVINCIA DI NASCITA`,
 1 AS `DESCRIZIONE STATO DI NASCITA`,
 1 AS `nato_a`,
 1 AS `datainizio`,
 1 AS `datafine`,
 1 AS `orepres`,
 1 AS `datacertificato`,
 1 AS `numero`,
 1 AS `idtipo`,
 1 AS `idmodo`,
 1 AS `classe`,
 1 AS `ore`,
 1 AS `annos`,
 1 AS `id`,
 1 AS `dirigente`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `qcorsocertificati_all`
--

DROP TABLE IF EXISTS `qcorsocertificati_all`;
/*!50001 DROP VIEW IF EXISTS `qcorsocertificati_all`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `qcorsocertificati_all` AS SELECT 
 1 AS `COGNOME`,
 1 AS `NOME`,
 1 AS `CODICE FISCALE`,
 1 AS `LUOGO DI NASCITA`,
 1 AS `DATA DI NASCITA`,
 1 AS `PROVINCIA DI NASCITA`,
 1 AS `DESCRIZIONE STATO DI NASCITA`,
 1 AS `nato_a`,
 1 AS `datainizio`,
 1 AS `datafine`,
 1 AS `orepres`,
 1 AS `datacertificato`,
 1 AS `numero`,
 1 AS `idtipo`,
 1 AS `idmodo`,
 1 AS `classe_attule`,
 1 AS `classe`,
 1 AS `ore`,
 1 AS `annos`,
 1 AS `id`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `qiscritti`
--

DROP TABLE IF EXISTS `qiscritti`;
/*!50001 DROP VIEW IF EXISTS `qiscritti`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `qiscritti` AS SELECT 
 1 AS `idtipo`,
 1 AS `cf`,
 1 AS `ok`,
 1 AS `dt`,
 1 AS `n`,
 1 AS `ente`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `qiscritticertificati`
--

DROP TABLE IF EXISTS `qiscritticertificati`;
/*!50001 DROP VIEW IF EXISTS `qiscritticertificati`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `qiscritticertificati` AS SELECT 
 1 AS `cf`,
 1 AS `gendt`,
 1 AS `genn`,
 1 AS `gene`,
 1 AS `basdt`,
 1 AS `basn`,
 1 AS `base`,
 1 AS `meddt`,
 1 AS `medn`,
 1 AS `mede`,
 1 AS `altdt`,
 1 AS `altn`,
 1 AS `alte`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `qiscrittisituazione`
--

DROP TABLE IF EXISTS `qiscrittisituazione`;
/*!50001 DROP VIEW IF EXISTS `qiscrittisituazione`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `qiscrittisituazione` AS SELECT 
 1 AS `cf`,
 1 AS `gendt`,
 1 AS `genn`,
 1 AS `gene`,
 1 AS `basdt`,
 1 AS `basn`,
 1 AS `base`,
 1 AS `meddt`,
 1 AS `medn`,
 1 AS `mede`,
 1 AS `altdt`,
 1 AS `altn`,
 1 AS `alte`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `qprgformativo`
--

DROP TABLE IF EXISTS `qprgformativo`;
/*!50001 DROP VIEW IF EXISTS `qprgformativo`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `qprgformativo` AS SELECT 
 1 AS `nomeaz`,
 1 AS `natura`,
 1 AS `Comune`,
 1 AS `Provincia`,
 1 AS `CAP`,
 1 AS `ateco`,
 1 AS `indirizzo_sl`,
 1 AS `cod_fiscale`,
 1 AS `part_iva`,
 1 AS `leg_rapp_nome`,
 1 AS `tel`,
 1 AS `mail`,
 1 AS `nproto`,
 1 AS `dproto`,
 1 AS `COGNOME`,
 1 AS `NOME`,
 1 AS `comuneN`,
 1 AS `prN`,
 1 AS `dataSt`,
 1 AS `viaSt`,
 1 AS `capSt`,
 1 AS `prR`,
 1 AS `comuneR`,
 1 AS `cfSt`,
 1 AS `classe`,
 1 AS `sez`,
 1 AS `specializz`,
 1 AS `idT`,
 1 AS `annos`,
 1 AS `dataPfi`,
 1 AS `annos1`,
 1 AS `nomeDoc`,
 1 AS `mailDoc`,
 1 AS `cellDoc`,
 1 AS `nomeTut`,
 1 AS `telTut`,
 1 AS `mailTut`,
 1 AS `inquadramento`,
 1 AS `ruolo`,
 1 AS `lavoro`,
 1 AS `datai`,
 1 AS `dataf`,
 1 AS `oreprev`,
 1 AS `descrizione`,
 1 AS `attivita`,
 1 AS `indirizzo`,
 1 AS `comuneOp`,
 1 AS `prOp`,
 1 AS `capOp`,
 1 AS `CognomeGen`,
 1 AS `NomeGen`,
 1 AS `CfGen`,
 1 AS `DtGen`,
 1 AS `ComuneGen`,
 1 AS `CapGen`,
 1 AS `prGen`,
 1 AS `statoestero`,
 1 AS `TELEFONO`,
 1 AS `cellGen`,
 1 AS `cellSt`,
 1 AS `mailSt`,
 1 AS `gendt`,
 1 AS `genn`,
 1 AS `gene`,
 1 AS `basdt`,
 1 AS `basn`,
 1 AS `base`,
 1 AS `meddt`,
 1 AS `medn`,
 1 AS `mede`,
 1 AS `altdt`,
 1 AS `altn`,
 1 AS `alte`,
 1 AS `dirigente`,
 1 AS `polizza`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `qprgformativocollettivo`
--

DROP TABLE IF EXISTS `qprgformativocollettivo`;
/*!50001 DROP VIEW IF EXISTS `qprgformativocollettivo`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `qprgformativocollettivo` AS SELECT 
 1 AS `nomeaz`,
 1 AS `natura`,
 1 AS `Comune`,
 1 AS `Provincia`,
 1 AS `CAP`,
 1 AS `ateco`,
 1 AS `indirizzo_sl`,
 1 AS `cod_fiscale`,
 1 AS `part_iva`,
 1 AS `leg_rapp_nome`,
 1 AS `tel`,
 1 AS `mail`,
 1 AS `nproto`,
 1 AS `dproto`,
 1 AS `Annos`,
 1 AS `annos1`,
 1 AS `IDAttivita`,
 1 AS `nomeTut`,
 1 AS `telTut`,
 1 AS `mailTut`,
 1 AS `inquadramento`,
 1 AS `ruolotut`,
 1 AS `Attivita`,
 1 AS `Note`,
 1 AS `NumOre`,
 1 AS `Referente`,
 1 AS `Datai`,
 1 AS `Dataf`,
 1 AS `dataPfc`,
 1 AS `dirigente`,
 1 AS `polizza`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `qprgformativocollettivo_old`
--

DROP TABLE IF EXISTS `qprgformativocollettivo_old`;
/*!50001 DROP VIEW IF EXISTS `qprgformativocollettivo_old`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `qprgformativocollettivo_old` AS SELECT 
 1 AS `nomeaz`,
 1 AS `natura`,
 1 AS `Comune`,
 1 AS `Provincia`,
 1 AS `CAP`,
 1 AS `ateco`,
 1 AS `indirizzo_sl`,
 1 AS `cod_fiscale`,
 1 AS `part_iva`,
 1 AS `leg_rapp_nome`,
 1 AS `tel`,
 1 AS `mail`,
 1 AS `nproto`,
 1 AS `dproto`,
 1 AS `Annos`,
 1 AS `annos1`,
 1 AS `IDAttivita`,
 1 AS `classe`,
 1 AS `studente`,
 1 AS `comuneN`,
 1 AS `prN`,
 1 AS `dataSt`,
 1 AS `specializz`,
 1 AS `nomeTut`,
 1 AS `telTut`,
 1 AS `mailTut`,
 1 AS `inquadramento`,
 1 AS `ruolotut`,
 1 AS `Attivita`,
 1 AS `Note`,
 1 AS `NumOre`,
 1 AS `Referente`,
 1 AS `Datai`,
 1 AS `Dataf`,
 1 AS `dataPfc`,
 1 AS `codf_St`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `qprogettoformativo`
--

DROP TABLE IF EXISTS `qprogettoformativo`;
/*!50001 DROP VIEW IF EXISTS `qprogettoformativo`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `qprogettoformativo` AS SELECT 
 1 AS `idT`,
 1 AS `nomea`,
 1 AS `natura`,
 1 AS `Comune`,
 1 AS `Provincia`,
 1 AS `CAP`,
 1 AS `ateco`,
 1 AS `indirizzo_sl`,
 1 AS `cod_fiscale`,
 1 AS `part_iva`,
 1 AS `leg_rapp_nome`,
 1 AS `tel`,
 1 AS `mail`,
 1 AS `nproto`,
 1 AS `dproto`,
 1 AS `COGNOME`,
 1 AS `NOME`,
 1 AS `comuneN`,
 1 AS `PROVINCIA DI NASCITA`,
 1 AS `DATA DI NASCITA`,
 1 AS `VIA (INDIRIZZO) RESIDENZA`,
 1 AS `CAP RESIDENZA`,
 1 AS `PROVINCIA RESIDENZA`,
 1 AS `comuneR`,
 1 AS `CODICE FISCALE`,
 1 AS `CLASSE 0`,
 1 AS `sez`,
 1 AS `specializz`,
 1 AS `annos`,
 1 AS `dataPfi`,
 1 AS `annos1`,
 1 AS `nomeDoc`,
 1 AS `mailDoc`,
 1 AS `cellDoc`,
 1 AS `nomeTut`,
 1 AS `telTut`,
 1 AS `mailTut`,
 1 AS `inquadramento`,
 1 AS `ruolo`,
 1 AS `lavoro`,
 1 AS `datai`,
 1 AS `dataf`,
 1 AS `oreprev`,
 1 AS `descrizione`,
 1 AS `attivita`,
 1 AS `indirizzo`,
 1 AS `comuneOp`,
 1 AS `prOp`,
 1 AS `capOp`,
 1 AS `COGNOME PARENTE 0`,
 1 AS `NOME PARENTE 0`,
 1 AS `CODICE FISCALE 0`,
 1 AS `DATA NASCITA PARENTE 0`,
 1 AS `LUOGO NASCITA PARENTE 0`,
 1 AS `CAP NASCITA PARENTE 0`,
 1 AS `PROVINCIA NASCITA PARENTE 0`,
 1 AS `statoestero`,
 1 AS `TELEFONO`,
 1 AS `cellGen`,
 1 AS `cellSt`,
 1 AS `mailSt`,
 1 AS `gendt`,
 1 AS `genn`,
 1 AS `gene`,
 1 AS `basdt`,
 1 AS `basn`,
 1 AS `base`,
 1 AS `meddt`,
 1 AS `medn`,
 1 AS `mede`,
 1 AS `altdt`,
 1 AS `altn`,
 1 AS `alte`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `qriassuntostudenti`
--

DROP TABLE IF EXISTS `qriassuntostudenti`;
/*!50001 DROP VIEW IF EXISTS `qriassuntostudenti`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `qriassuntostudenti` AS SELECT 
 1 AS `classe`,
 1 AS `COGNOME`,
 1 AS `NOME`,
 1 AS `cf`,
 1 AS `gendt`,
 1 AS `genn`,
 1 AS `gene`,
 1 AS `basdt`,
 1 AS `basn`,
 1 AS `base`,
 1 AS `meddt`,
 1 AS `medn`,
 1 AS `mede`,
 1 AS `altdt`,
 1 AS `altn`,
 1 AS `alte`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `qstudentestorico`
--

DROP TABLE IF EXISTS `qstudentestorico`;
/*!50001 DROP VIEW IF EXISTS `qstudentestorico`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `qstudentestorico` AS SELECT 
 1 AS `idstu`,
 1 AS `anno`,
 1 AS `classi`,
 1 AS `stato`,
 1 AS `dal`,
 1 AS `valido`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `qtrainingcertificati`
--

DROP TABLE IF EXISTS `qtrainingcertificati`;
/*!50001 DROP VIEW IF EXISTS `qtrainingcertificati`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `qtrainingcertificati` AS SELECT 
 1 AS `nominativo`,
 1 AS `cf`,
 1 AS `luogo`,
 1 AS `datan`,
 1 AS `datai`,
 1 AS `dataf`,
 1 AS `orepres`,
 1 AS `datac`,
 1 AS `numero`,
 1 AS `idtipo`,
 1 AS `idmodo`,
 1 AS `ore`,
 1 AS `id`,
 1 AS `descr`,
 1 AS `doc`,
 1 AS `prefisso`,
 1 AS `annos`,
 1 AS `nomecorso`,
 1 AS `ente`,
 1 AS `tipo`,
 1 AS `sede`,
 1 AS `relatore`,
 1 AS `enteEsterno`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `slot`
--

DROP TABLE IF EXISTS `slot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `slot` (
  `idS` int(11) NOT NULL AUTO_INCREMENT,
  `idAzienda` int(11) DEFAULT NULL,
  `annos` smallint(6) DEFAULT NULL,
  `datai` datetime DEFAULT NULL,
  `dataf` datetime DEFAULT NULL,
  `oreprev` smallint(6) DEFAULT NULL,
  `idtirocinio` int(11) DEFAULT NULL,
  `tipo` int(11) DEFAULT NULL,
  `impiego` int(11) DEFAULT NULL,
  `schi` bit(1) DEFAULT b'0',
  `sinf` bit(1) DEFAULT b'0',
  `smec` bit(1) DEFAULT b'0',
  `slst` bit(1) DEFAULT b'0',
  `note` varchar(80) DEFAULT NULL,
  `attivita` varchar(120) DEFAULT NULL,
  `idCreatore` int(11) DEFAULT '1',
  PRIMARY KEY (`idS`)
) ENGINE=InnoDB AUTO_INCREMENT=5910 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `slotimpiego`
--

DROP TABLE IF EXISTS `slotimpiego`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `slotimpiego` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attivita` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `slottipo`
--

DROP TABLE IF EXISTS `slottipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `slottipo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descrizione` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `studente`
--

DROP TABLE IF EXISTS `studente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `studente` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `COGNOME` varchar(80) DEFAULT NULL,
  `NOME` varchar(80) DEFAULT NULL,
  `MATRICOLA` smallint(4) DEFAULT NULL,
  `CODICE FISCALE` varchar(16) DEFAULT NULL,
  `CODICE COMUNE RESIDENZA` varchar(6) DEFAULT NULL,
  `CITTA' RESIDENZA` varchar(128) DEFAULT NULL,
  `VIA (INDIRIZZO) RESIDENZA` varchar(128) DEFAULT NULL,
  `CAP RESIDENZA` varchar(5) DEFAULT NULL,
  `PROVINCIA RESIDENZA` varchar(64) DEFAULT NULL,
  `CODICE COMUNE DOMICILIO` varchar(6) DEFAULT NULL,
  `CITTA' DOMICILIO` varchar(128) DEFAULT NULL,
  `VIA (INDIRIZZO) DOMICILIO` varchar(128) DEFAULT NULL,
  `CAP DOMICILIO` varchar(5) DEFAULT NULL,
  `PROVINCIA DOMICILIO` varchar(128) DEFAULT NULL,
  `CITTADINANZA` varchar(80) DEFAULT NULL,
  `DESCRIZIONE STATO DI NASCITA` varchar(128) DEFAULT NULL,
  `CITTA' STRANIERA DI NASCITA` varchar(128) DEFAULT NULL,
  `CODICE STATO DI NASCITA` varchar(4) DEFAULT NULL,
  `CODICE COMUNE DI NASCITA` varchar(6) DEFAULT NULL,
  `LUOGO DI NASCITA` varchar(128) DEFAULT NULL,
  `CAP LUOGO NASCITA` varchar(5) DEFAULT NULL,
  `PROVINCIA DI NASCITA` varchar(128) DEFAULT NULL,
  `DATA DI NASCITA` varchar(12) DEFAULT NULL,
  `SESSO` char(1) DEFAULT NULL,
  `TELEFONO` varchar(40) DEFAULT NULL,
  `CELLULARE 1` varchar(20) DEFAULT NULL,
  `CELLULARE 2` varchar(20) DEFAULT NULL,
  `CELLULARE ALLIEVO` varchar(20) DEFAULT NULL,
  `EMAIL 1` varchar(128) DEFAULT NULL,
  `EMAIL 2` varchar(128) DEFAULT NULL,
  `ID CLASSE 0` varchar(8) DEFAULT NULL,
  `CLASSE 0` tinyint(1) DEFAULT NULL,
  `SEZIONE 0` varchar(8) DEFAULT NULL,
  `INDIRIZZO 0` varchar(128) DEFAULT NULL,
  `N DI REGISTRO 0` int(11) DEFAULT NULL,
  `ID CLASSE 1` varchar(8) DEFAULT NULL,
  `CLASSE 1` tinyint(1) DEFAULT NULL,
  `SEZIONE 1` varchar(8) DEFAULT NULL,
  `INDIRIZZO 1` varchar(128) DEFAULT NULL,
  `N DI REGISTRO 1` int(11) DEFAULT NULL,
  `GRADO PARENTELA 0` char(1) DEFAULT NULL,
  `COGNOME PARENTE 0` varchar(80) DEFAULT NULL,
  `NOME PARENTE 0` varchar(80) DEFAULT NULL,
  `CODICE FISCALE 0` varchar(16) DEFAULT NULL,
  `DATA NASCITA PARENTE 0` varchar(12) DEFAULT NULL,
  `LUOGO NASCITA PARENTE 0` varchar(128) DEFAULT NULL,
  `CAP NASCITA PARENTE 0` varchar(5) DEFAULT NULL,
  `PROVINCIA NASCITA PARENTE 0` varchar(4) DEFAULT NULL,
  `REGIONE NASCITA PARENTE 0` varchar(4) DEFAULT NULL,
  `STATO NASCITA PARENTE 0` varchar(128) DEFAULT NULL,
  `LUOGO RESIDENZA PARENTE 0` varchar(128) DEFAULT NULL,
  `INDIRIZZO RESIDENZA PARENTE 0` varchar(128) DEFAULT NULL,
  `CAP RESIDENZA PARENTE 0` varchar(5) DEFAULT NULL,
  `PROVINCIA RESIDENZA PARENTE 0` varchar(4) DEFAULT NULL,
  `REGIONE RESIDENZA PARENTE 0` varchar(4) DEFAULT NULL,
  `STATO CITTADINANZA PARENTE 0` varchar(128) DEFAULT NULL,
  `TELEFONO ABITAZIONE PARENTE 0` varchar(20) DEFAULT NULL,
  `TELEFONO CELLULARE PARENTE 0` varchar(20) DEFAULT NULL,
  `EMAIL PARENTE 0` varchar(128) DEFAULT NULL,
  `GRADO PARENTELA 1` char(1) DEFAULT NULL,
  `COGNOME PARENTE 1` varchar(80) DEFAULT NULL,
  `NOME PARENTE 1` varchar(80) DEFAULT NULL,
  `CODICE FISCALE 1` varchar(16) DEFAULT NULL,
  `DATA NASCITA PARENTE 1` varchar(12) DEFAULT NULL,
  `LUOGO NASCITA PARENTE 1` varchar(128) DEFAULT NULL,
  `CAP NASCITA PARENTE 1` varchar(5) DEFAULT NULL,
  `PROVINCIA NASCITA PARENTE 1` varchar(4) DEFAULT NULL,
  `REGIONE NASCITA PARENTE 1` varchar(4) DEFAULT NULL,
  `STATO NASCITA PARENTE 1` varchar(128) DEFAULT NULL,
  `LUOGO RESIDENZA PARENTE 1` varchar(128) DEFAULT NULL,
  `INDIRIZZO RESIDENZA PARENTE 1` varchar(128) DEFAULT NULL,
  `CAP RESIDENZA PARENTE 1` varchar(5) DEFAULT NULL,
  `PROVINCIA RESIDENZA PARENTE 1` varchar(4) DEFAULT NULL,
  `REGIONE RESIDENZA PARENTE 1` varchar(4) DEFAULT NULL,
  `STATO CITTADINANZA PARENTE 1` varchar(128) DEFAULT NULL,
  `TELEFONO ABITAZIONE PARENTE 1` varchar(20) DEFAULT NULL,
  `TELEFONO CELLULARE PARENTE 1` varchar(20) DEFAULT NULL,
  `EMAIL PARENTE 1` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `CODICE FISCALE_UNIQUE` (`CODICE FISCALE`),
  KEY `CODFISCALE` (`CODICE FISCALE`)
) ENGINE=InnoDB AUTO_INCREMENT=6363 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `studstorico`
--

DROP TABLE IF EXISTS `studstorico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `studstorico` (
  `idstu` smallint(6) DEFAULT NULL,
  `anno` smallint(6) DEFAULT NULL,
  `classe` varchar(8) DEFAULT NULL,
  `stato` varchar(10) DEFAULT NULL,
  `dal` datetime DEFAULT NULL,
  `valido` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ticket` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `valore` int(11) DEFAULT NULL,
  `massimo` int(11) DEFAULT NULL,
  `modifica` datetime DEFAULT NULL,
  `testo` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ticket_log`
--

DROP TABLE IF EXISTS `ticket_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ticket_log` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `postazione` int(11) DEFAULT NULL,
  `serve` int(11) DEFAULT NULL,
  `data` datetime DEFAULT CURRENT_TIMESTAMP,
  `note` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1352 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ticket_postazioni`
--

DROP TABLE IF EXISTS `ticket_postazioni`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ticket_postazioni` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `descr` varchar(255) DEFAULT NULL,
  `serve` int(11) DEFAULT NULL,
  `attiva` bit(1) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tirocinio`
--

DROP TABLE IF EXISTS `tirocinio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tirocinio` (
  `idT` int(11) NOT NULL AUTO_INCREMENT,
  `idStud` varchar(16) DEFAULT NULL,
  `oreeff` smallint(6) DEFAULT NULL,
  `classe` varchar(10) DEFAULT NULL,
  `annos` int(11) DEFAULT NULL,
  `tutor` varchar(18) DEFAULT NULL,
  `dataPfi` datetime DEFAULT NULL,
  `dataieff` datetime DEFAULT NULL,
  `datafeff` datetime DEFAULT NULL,
  `giudizio` smallint(6) DEFAULT NULL,
  `valutazione` smallint(6) DEFAULT NULL,
  `invioMail` bit(1) DEFAULT b'0',
  `restpfi` bit(1) DEFAULT b'0',
  `restsva` bit(1) DEFAULT b'0',
  `restsvs` bit(1) DEFAULT b'0',
  `restffp` bit(1) DEFAULT b'0',
  `note` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`idT`)
) ENGINE=InnoDB AUTO_INCREMENT=7261 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tirociniovoti`
--

DROP TABLE IF EXISTS `tirociniovoti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tirociniovoti` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `voto` varchar(20) DEFAULT NULL,
  `attivo` bit(1) DEFAULT b'1',
  `az_st` bit(1) DEFAULT b'1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `training`
--

DROP TABLE IF EXISTS `training`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `training` (
  `idtraining` int(11) NOT NULL AUTO_INCREMENT,
  `idtipo` int(11) DEFAULT NULL,
  `idmodo` int(11) DEFAULT NULL,
  `annos` int(11) DEFAULT NULL,
  `descr` varchar(255) DEFAULT NULL,
  `datai` datetime DEFAULT NULL,
  `dataf` datetime DEFAULT NULL,
  `ore` int(11) DEFAULT NULL,
  `docente` varchar(255) DEFAULT NULL,
  `esterno` bit(1) DEFAULT b'0',
  `note` varchar(255) DEFAULT NULL,
  `enteEsterno` varchar(255) DEFAULT NULL,
  `sede` varchar(255) DEFAULT NULL,
  `ateco` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`idtraining`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `training_iscritti`
--

DROP TABLE IF EXISTS `training_iscritti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `training_iscritti` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idtraining` int(11) DEFAULT NULL,
  `idcorsista` varchar(16) DEFAULT NULL,
  `orepres` int(11) DEFAULT NULL,
  `superato` bit(1) DEFAULT b'0',
  `voto` tinyint(4) DEFAULT NULL,
  `datac` datetime DEFAULT NULL,
  `numero` varchar(15) DEFAULT NULL,
  `firma` bit(1) DEFAULT b'0',
  `notifica` bit(1) DEFAULT b'0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1003 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `training_modo`
--

DROP TABLE IF EXISTS `training_modo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `training_modo` (
  `idmodo` int(11) NOT NULL AUTO_INCREMENT,
  `descr` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idmodo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `training_tipo`
--

DROP TABLE IF EXISTS `training_tipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `training_tipo` (
  `idtipo` int(11) NOT NULL AUTO_INCREMENT,
  `descr` varchar(100) DEFAULT NULL,
  `doc` varchar(50) DEFAULT NULL,
  `prefisso` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`idtipo`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tut_tir`
--

DROP TABLE IF EXISTS `tut_tir`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tut_tir` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idTutor` int(11) DEFAULT NULL,
  `idTirocinio` int(11) DEFAULT NULL,
  `dal` datetime DEFAULT NULL,
  `al` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3433 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tutor`
--

DROP TABLE IF EXISTS `tutor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tutor` (
  `idT` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(80) DEFAULT NULL,
  `idA` int(11) DEFAULT NULL,
  `tel` varchar(15) DEFAULT NULL,
  `mail` varchar(80) DEFAULT NULL,
  `ruolo` varchar(100) DEFAULT NULL,
  `idInquad` int(11) DEFAULT NULL,
  `stato` bit(1) DEFAULT b'1',
  PRIMARY KEY (`idT`)
) ENGINE=InnoDB AUTO_INCREMENT=1331 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tutorinquadr`
--

DROP TABLE IF EXISTS `tutorinquadr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tutorinquadr` (
  `idInquad` int(11) NOT NULL AUTO_INCREMENT,
  `descr` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idInquad`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `weblog`
--

DROP TABLE IF EXISTS `weblog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `weblog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `data` datetime DEFAULT NULL,
  `motivo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=977 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `webuser`
--

DROP TABLE IF EXISTS `webuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `webuser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `passwd` varchar(255) DEFAULT NULL,
  `admin` bit(1) DEFAULT b'0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Final view structure for view `qclasse`
--

/*!50001 DROP VIEW IF EXISTS `qclasse`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`utente`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `qclasse` AS select distinct `studstorico`.`anno` AS `anno`,`studstorico`.`classe` AS `classe` from `studstorico` order by `studstorico`.`anno`,`studstorico`.`classe` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `qcommessa`
--

/*!50001 DROP VIEW IF EXISTS `qcommessa`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`utente`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `qcommessa` AS select `attivita`.`IDAttivita` AS `IDAttivita`,`attivita`.`Attivita` AS `Attivita`,`attivita`.`Referente` AS `Referente`,`attivita`.`Annos` AS `Annos`,`attivita`.`Note` AS `Note`,`attivita`.`Datai` AS `Datai`,`attivita`.`Dataf` AS `Dataf`,`azienda`.`nome` AS `nome` from (`attivita` join `azienda` on((`attivita`.`IdAz` = `azienda`.`idAz`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `qcommessastudenti`
--

/*!50001 DROP VIEW IF EXISTS `qcommessastudenti`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`utente`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `qcommessastudenti` AS select `attivita`.`IDAttivita` AS `IDAttivita`,concat(`studente`.`COGNOME`,' ',`studente`.`NOME`) AS `studente`,`attivita_studenti`.`NumOrePres` AS `NumOrePres`,`studstorico`.`classe` AS `classe`,`studstorico`.`anno` AS `anno`,ifnull(`studente`.`INDIRIZZO 1`,`studente`.`INDIRIZZO 0`) AS `specializz`,`studente`.`CODICE FISCALE` AS `codf_st`,`attivita`.`Attivita` AS `Attivita`,`attivita`.`Annos` AS `Annos`,(`attivita`.`Annos` + 1) AS `Annos1`,`attivita`.`Datai` AS `Datai`,`attivita`.`Dataf` AS `Dataf`,`attivita`.`NumOre` AS `NumOre`,`attivita`.`dataPfc` AS `dataPfc`,`azienda`.`nome` AS `nomeaz`,`azienda`.`part_iva` AS `part_iva`,`azienda`.`dproto` AS `dproto`,`azienda`.`nproto` AS `nproto`,`azienda`.`indirizzo_sl` AS `indirizzo_sl`,`comune`.`Comune` AS `Comune`,`comune`.`Provincia` AS `Provincia`,`comune`.`CAP` AS `CAP` from (((((`studente` join `attivita_studenti` on((`studente`.`CODICE FISCALE` = `attivita_studenti`.`IDStudente`))) join `studstorico` on((`studente`.`MATRICOLA` = `studstorico`.`idstu`))) join `attivita` on(((`studstorico`.`anno` = `attivita`.`Annos`) and (`attivita_studenti`.`IDAttivita` = `attivita`.`IDAttivita`)))) join `azienda` on((`attivita`.`IdAz` = `azienda`.`idAz`))) join `comune` on((`azienda`.`comune_sl` = `comune`.`Istat`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `qconvenzione`
--

/*!50001 DROP VIEW IF EXISTS `qconvenzione`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`utente`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `qconvenzione` AS select `azienda`.`nome` AS `nome`,`azienda_tipo`.`natura` AS `natura`,`comune`.`Comune` AS `Comune`,`comune`.`Provincia` AS `Provincia`,`comune`.`CAP` AS `CAP`,`azienda`.`indirizzo_sl` AS `indirizzo_sl`,`azienda`.`cod_fiscale` AS `cod_fiscale`,`azienda`.`part_iva` AS `part_iva`,`azienda`.`leg_rapp_nome` AS `leg_rapp_nome`,`comune_2`.`Comune` AS `leg_comune`,`comune_2`.`Provincia` AS `leg_pr`,`comune_2`.`CAP` AS `leg_cap`,`azienda`.`leg_rapp_dt` AS `leg_rapp_dt`,`azienda`.`leg_rapp_cf` AS `leg_rapp_cf`,`azienda`.`nproto` AS `nproto`,`azienda`.`dproto` AS `dproto`,`azienda`.`idAz` AS `idAz` from (((`azienda` join `comune` on((`azienda`.`comune_sl` = `comune`.`Istat`))) join `comune` `comune_2` on((`azienda`.`leg_rapp_nato_a` = `comune_2`.`Istat`))) left join `azienda_tipo` on((`azienda`.`natura` = `azienda_tipo`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `qcorsocertificati`
--

/*!50001 DROP VIEW IF EXISTS `qcorsocertificati`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`utente`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `qcorsocertificati` AS select `studente`.`COGNOME` AS `COGNOME`,`studente`.`NOME` AS `NOME`,`studente`.`CODICE FISCALE` AS `CODICE FISCALE`,`studente`.`LUOGO DI NASCITA` AS `LUOGO DI NASCITA`,`studente`.`DATA DI NASCITA` AS `DATA DI NASCITA`,`studente`.`PROVINCIA DI NASCITA` AS `PROVINCIA DI NASCITA`,`studente`.`DESCRIZIONE STATO DI NASCITA` AS `DESCRIZIONE STATO DI NASCITA`,if(isnull(`studente`.`LUOGO DI NASCITA`),`studente`.`DESCRIZIONE STATO DI NASCITA`,concat(`studente`.`LUOGO DI NASCITA`,' (',`studente`.`PROVINCIA DI NASCITA`,')')) AS `nato_a`,date_format(`corso`.`datai`,'%d/%m/%Y') AS `datainizio`,date_format(`corso`.`dataf`,'%d/%m/%Y') AS `datafine`,`corso_iscritti`.`orepres` AS `orepres`,date_format(`corso_iscritti`.`datac`,'%d/%m/%Y') AS `datacertificato`,`corso_iscritti`.`numero` AS `numero`,`corso`.`idtipo` AS `idtipo`,`corso`.`idmodo` AS `idmodo`,`studstorico`.`classe` AS `classe`,`corso`.`ore` AS `ore`,`corso`.`annos` AS `annos`,`corso_iscritti`.`id` AS `id`,`firma`.`dirigente` AS `dirigente` from ((((`corso_iscritti` join `corso` on((`corso_iscritti`.`idcorso` = `corso`.`idcorso`))) join `studente` on((`corso_iscritti`.`idiscritto` = `studente`.`CODICE FISCALE`))) join `studstorico` on((`studstorico`.`idstu` = `studente`.`MATRICOLA`))) join `firma` on((`studstorico`.`anno` = `firma`.`annos`))) where ((`corso`.`annos` = `studstorico`.`anno`) and (`corso_iscritti`.`numero` <> '') and (`corso_iscritti`.`firma` = 0) and (`corso`.`esterno` = 0)) order by `studstorico`.`classe`,`studente`.`COGNOME`,`studente`.`NOME`,`studente`.`CODICE FISCALE` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `qcorsocertificati_all`
--

/*!50001 DROP VIEW IF EXISTS `qcorsocertificati_all`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`utente`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `qcorsocertificati_all` AS select `studente`.`COGNOME` AS `COGNOME`,`studente`.`NOME` AS `NOME`,`studente`.`CODICE FISCALE` AS `CODICE FISCALE`,`studente`.`LUOGO DI NASCITA` AS `LUOGO DI NASCITA`,`studente`.`DATA DI NASCITA` AS `DATA DI NASCITA`,`studente`.`PROVINCIA DI NASCITA` AS `PROVINCIA DI NASCITA`,`studente`.`DESCRIZIONE STATO DI NASCITA` AS `DESCRIZIONE STATO DI NASCITA`,if(isnull(`studente`.`LUOGO DI NASCITA`),`studente`.`DESCRIZIONE STATO DI NASCITA`,concat(`studente`.`LUOGO DI NASCITA`,' (',`studente`.`PROVINCIA DI NASCITA`,')')) AS `nato_a`,date_format(`corso`.`datai`,'%d/%m/%Y') AS `datainizio`,date_format(`corso`.`dataf`,'%d/%m/%Y') AS `datafine`,`corso_iscritti`.`orepres` AS `orepres`,date_format(`corso_iscritti`.`datac`,'%d/%m/%Y') AS `datacertificato`,`corso_iscritti`.`numero` AS `numero`,`corso`.`idtipo` AS `idtipo`,`corso`.`idmodo` AS `idmodo`,if(isnull(`studente`.`ID CLASSE 1`),concat(`studente`.`CLASSE 0`,`studente`.`SEZIONE 0`),concat(`studente`.`CLASSE 1`,`studente`.`SEZIONE 1`)) AS `classe_attule`,`studstorico`.`classe` AS `classe`,`corso`.`ore` AS `ore`,`corso`.`annos` AS `annos`,`corso_iscritti`.`id` AS `id` from (((`corso_iscritti` join `corso` on((`corso_iscritti`.`idcorso` = `corso`.`idcorso`))) join `studente` on((`corso_iscritti`.`idiscritto` = `studente`.`CODICE FISCALE`))) join `studstorico` on((`studente`.`MATRICOLA` = `studstorico`.`idstu`))) where ((`corso_iscritti`.`numero` <> '') and (`corso_iscritti`.`firma` = TRUE) and (`corso`.`esterno` = FALSE) and (`corso`.`annos` = 2018) and (`studstorico`.`anno` = 2018)) order by if(isnull(`studente`.`ID CLASSE 1`),concat(`studente`.`CLASSE 0`,`studente`.`SEZIONE 0`),concat(`studente`.`CLASSE 1`,`studente`.`SEZIONE 1`)),`studente`.`COGNOME`,`studente`.`NOME`,`studente`.`CODICE FISCALE` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `qiscritti`
--

/*!50001 DROP VIEW IF EXISTS `qiscritti`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`utente`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `qiscritti` AS select `corso`.`idtipo` AS `idtipo`,`corso_iscritti`.`idiscritto` AS `cf`,`corso_iscritti`.`superato` AS `ok`,`corso_iscritti`.`datac` AS `dt`,`corso_iscritti`.`numero` AS `n`,if(`corso`.`esterno`,`corso`.`enteEsterno`,'IIS G.Galilei Crema') AS `ente` from (`corso_iscritti` join `corso` on((`corso_iscritti`.`idcorso` = `corso`.`idcorso`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `qiscritticertificati`
--

/*!50001 DROP VIEW IF EXISTS `qiscritticertificati`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`utente`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `qiscritticertificati` AS select `c`.`cf` AS `cf`,max(`c`.`gendt`) AS `gendt`,max(`c`.`genn`) AS `genn`,max(`c`.`gene`) AS `gene`,max(`c`.`basdt`) AS `basdt`,max(`c`.`basn`) AS `basn`,max(`c`.`base`) AS `base`,max(`c`.`meddt`) AS `meddt`,max(`c`.`medn`) AS `medn`,max(`c`.`mede`) AS `mede`,max(`c`.`altdt`) AS `altdt`,max(`c`.`altn`) AS `altn`,max(`c`.`alte`) AS `alte` from (select `qiscritti`.`cf` AS `cf`,`qiscritti`.`dt` AS `gendt`,`qiscritti`.`n` AS `genn`,`qiscritti`.`ente` AS `gene`,0 AS `basdt`,0 AS `basn`,0 AS `base`,0 AS `meddt`,0 AS `medn`,0 AS `mede`,0 AS `altdt`,0 AS `altn`,0 AS `alte` from `datigalilei`.`qiscritti` where (`qiscritti`.`ok` and (`qiscritti`.`idtipo` = 1)) union all select `qiscritti`.`cf` AS `cf`,0 AS `gendt`,0 AS `genn`,0 AS `gene`,`qiscritti`.`dt` AS `basdt`,`qiscritti`.`n` AS `basn`,`qiscritti`.`ente` AS `base`,0 AS `meddt`,0 AS `medn`,0 AS `mede`,0 AS `altdt`,0 AS `altn`,0 AS `alte` from `datigalilei`.`qiscritti` where (`qiscritti`.`ok` and (`qiscritti`.`idtipo` = 2)) union all select `qiscritti`.`cf` AS `cf`,0 AS `gendt`,0 AS `genn`,0 AS `gene`,0 AS `basdt`,0 AS `basn`,0 AS `base`,`qiscritti`.`dt` AS `meddt`,`qiscritti`.`n` AS `medn`,`qiscritti`.`ente` AS `mede`,0 AS `altdt`,0 AS `altn`,0 AS `alte` from `datigalilei`.`qiscritti` where (`qiscritti`.`ok` and (`qiscritti`.`idtipo` = 3)) union all select `qiscritti`.`cf` AS `cf`,0 AS `gendt`,0 AS `genn`,0 AS `gene`,0 AS `basdt`,0 AS `basn`,0 AS `base`,0 AS `meddt`,0 AS `medn`,0 AS `mede`,`qiscritti`.`dt` AS `altdt`,`qiscritti`.`n` AS `altn`,`qiscritti`.`ente` AS `alte` from `datigalilei`.`qiscritti` where (`qiscritti`.`ok` and (`qiscritti`.`idtipo` = 4))) `c` group by `c`.`cf` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `qiscrittisituazione`
--

/*!50001 DROP VIEW IF EXISTS `qiscrittisituazione`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`utente`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `qiscrittisituazione` AS select `c`.`cf` AS `cf`,max(`c`.`gendt`) AS `gendt`,max(`c`.`genn`) AS `genn`,max(`c`.`gene`) AS `gene`,max(`c`.`basdt`) AS `basdt`,max(`c`.`basn`) AS `basn`,max(`c`.`base`) AS `base`,max(`c`.`meddt`) AS `meddt`,max(`c`.`medn`) AS `medn`,max(`c`.`mede`) AS `mede`,max(`c`.`altdt`) AS `altdt`,max(`c`.`altn`) AS `altn`,max(`c`.`alte`) AS `alte` from (select `qiscritti`.`cf` AS `cf`,`qiscritti`.`dt` AS `gendt`,`qiscritti`.`n` AS `genn`,`qiscritti`.`ente` AS `gene`,0 AS `basdt`,0 AS `basn`,0 AS `base`,0 AS `meddt`,0 AS `medn`,0 AS `mede`,0 AS `altdt`,0 AS `altn`,0 AS `alte` from `datigalilei`.`qiscritti` where (`qiscritti`.`idtipo` = 1) union all select `qiscritti`.`cf` AS `cf`,0 AS `gendt`,0 AS `genn`,0 AS `gene`,`qiscritti`.`dt` AS `basdt`,`qiscritti`.`n` AS `basn`,`qiscritti`.`ente` AS `base`,0 AS `meddt`,0 AS `medn`,0 AS `mede`,0 AS `altdt`,0 AS `altn`,0 AS `alte` from `datigalilei`.`qiscritti` where (`qiscritti`.`idtipo` = 2) union all select `qiscritti`.`cf` AS `cf`,0 AS `gendt`,0 AS `genn`,0 AS `gene`,0 AS `basdt`,0 AS `basn`,0 AS `base`,`qiscritti`.`dt` AS `meddt`,`qiscritti`.`n` AS `medn`,`qiscritti`.`ente` AS `mede`,0 AS `altdt`,0 AS `altn`,0 AS `alte` from `datigalilei`.`qiscritti` where (`qiscritti`.`idtipo` = 3) union all select `qiscritti`.`cf` AS `cf`,0 AS `gendt`,0 AS `genn`,0 AS `gene`,0 AS `basdt`,0 AS `basn`,0 AS `base`,0 AS `meddt`,0 AS `medn`,0 AS `mede`,`qiscritti`.`dt` AS `altdt`,`qiscritti`.`n` AS `altn`,`qiscritti`.`ente` AS `alte` from `datigalilei`.`qiscritti` where (`qiscritti`.`idtipo` = 4)) `c` group by `c`.`cf` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `qprgformativo`
--

/*!50001 DROP VIEW IF EXISTS `qprgformativo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`utente`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `qprgformativo` AS select `datigalilei`.`azienda`.`nome` AS `nomeaz`,`datigalilei`.`azienda_tipo`.`natura` AS `natura`,`datigalilei`.`comune`.`Comune` AS `Comune`,`datigalilei`.`comune`.`Provincia` AS `Provincia`,`datigalilei`.`comune`.`CAP` AS `CAP`,`datigalilei`.`azienda`.`ateco` AS `ateco`,`datigalilei`.`azienda`.`indirizzo_sl` AS `indirizzo_sl`,`datigalilei`.`azienda`.`cod_fiscale` AS `cod_fiscale`,`datigalilei`.`azienda`.`part_iva` AS `part_iva`,`datigalilei`.`azienda`.`leg_rapp_nome` AS `leg_rapp_nome`,`datigalilei`.`azienda`.`tel` AS `tel`,`datigalilei`.`azienda`.`mail` AS `mail`,`datigalilei`.`azienda`.`nproto` AS `nproto`,`datigalilei`.`azienda`.`dproto` AS `dproto`,`datigalilei`.`studente`.`COGNOME` AS `COGNOME`,`datigalilei`.`studente`.`NOME` AS `NOME`,`comune_1`.`Comune` AS `comuneN`,`datigalilei`.`studente`.`PROVINCIA DI NASCITA` AS `prN`,ifnull(str_to_date(`datigalilei`.`studente`.`DATA DI NASCITA`,'%d/%m/%Y'),date_format(`datigalilei`.`studente`.`DATA DI NASCITA`,'%Y-%m-%d')) AS `dataSt`,`datigalilei`.`studente`.`VIA (INDIRIZZO) RESIDENZA` AS `viaSt`,`datigalilei`.`studente`.`CAP RESIDENZA` AS `capSt`,`datigalilei`.`studente`.`PROVINCIA RESIDENZA` AS `prR`,`datigalilei`.`studente`.`CITTA' RESIDENZA` AS `comuneR`,`datigalilei`.`studente`.`CODICE FISCALE` AS `cfSt`,left(`datigalilei`.`studstorico`.`classe`,1) AS `classe`,substr(`datigalilei`.`studstorico`.`classe`,2,5) AS `sez`,ifnull(`datigalilei`.`studente`.`INDIRIZZO 1`,`datigalilei`.`studente`.`INDIRIZZO 0`) AS `specializz`,`datigalilei`.`tirocinio`.`idT` AS `idT`,`datigalilei`.`tirocinio`.`annos` AS `annos`,`datigalilei`.`tirocinio`.`dataPfi` AS `dataPfi`,(`datigalilei`.`tirocinio`.`annos` + 1) AS `annos1`,`datigalilei`.`docente`.`nominativo` AS `nomeDoc`,`datigalilei`.`docente`.`mail` AS `mailDoc`,`datigalilei`.`docente`.`cell` AS `cellDoc`,`datigalilei`.`tutor`.`nome` AS `nomeTut`,`datigalilei`.`tutor`.`tel` AS `telTut`,`datigalilei`.`tutor`.`mail` AS `mailTut`,`datigalilei`.`tutorinquadr`.`descr` AS `inquadramento`,`datigalilei`.`tutor`.`ruolo` AS `ruolo`,`datigalilei`.`slot`.`attivita` AS `lavoro`,`datigalilei`.`slot`.`datai` AS `datai`,`datigalilei`.`slot`.`dataf` AS `dataf`,`datigalilei`.`slot`.`oreprev` AS `oreprev`,`datigalilei`.`slottipo`.`descrizione` AS `descrizione`,`datigalilei`.`slotimpiego`.`attivita` AS `attivita`,`datigalilei`.`azienda`.`indirizzo` AS `indirizzo`,`comune_3`.`Comune` AS `comuneOp`,`comune_3`.`Provincia` AS `prOp`,`comune_3`.`CAP` AS `capOp`,`datigalilei`.`studente`.`COGNOME PARENTE 0` AS `CognomeGen`,`datigalilei`.`studente`.`NOME PARENTE 0` AS `NomeGen`,`datigalilei`.`studente`.`CODICE FISCALE 0` AS `CfGen`,`datigalilei`.`studente`.`DATA NASCITA PARENTE 0` AS `DtGen`,ifnull(`datigalilei`.`studente`.`LUOGO NASCITA PARENTE 0`,`datigalilei`.`studente`.`STATO NASCITA PARENTE 0`) AS `ComuneGen`,`datigalilei`.`studente`.`CAP NASCITA PARENTE 0` AS `CapGen`,`datigalilei`.`studente`.`PROVINCIA NASCITA PARENTE 0` AS `prGen`,`datigalilei`.`studente`.`DESCRIZIONE STATO DI NASCITA` AS `statoestero`,`datigalilei`.`studente`.`TELEFONO` AS `TELEFONO`,`datigalilei`.`studente`.`CELLULARE 1` AS `cellGen`,`datigalilei`.`studente`.`CELLULARE ALLIEVO` AS `cellSt`,if((locate('dominio.it',`datigalilei`.`studente`.`EMAIL 1`) <> 0),'',`datigalilei`.`studente`.`EMAIL 1`) AS `mailSt`,`qiscritticertificati`.`gendt` AS `gendt`,`qiscritticertificati`.`genn` AS `genn`,`qiscritticertificati`.`gene` AS `gene`,`qiscritticertificati`.`basdt` AS `basdt`,`qiscritticertificati`.`basn` AS `basn`,`qiscritticertificati`.`base` AS `base`,`qiscritticertificati`.`meddt` AS `meddt`,`qiscritticertificati`.`medn` AS `medn`,`qiscritticertificati`.`mede` AS `mede`,`qiscritticertificati`.`altdt` AS `altdt`,`qiscritticertificati`.`altn` AS `altn`,`qiscritticertificati`.`alte` AS `alte`,`datigalilei`.`firma`.`dirigente` AS `dirigente`,`datigalilei`.`firma`.`assicurazione` AS `polizza` from ((((`datigalilei`.`comune` `comune_3` join ((((`datigalilei`.`tut_tir` join (((`datigalilei`.`docente` join (`datigalilei`.`studente` join ((`datigalilei`.`slot` join ((`datigalilei`.`azienda` join `datigalilei`.`comune` on((`datigalilei`.`azienda`.`comune_sl` = `datigalilei`.`comune`.`Istat`))) left join `datigalilei`.`azienda_tipo` on((`datigalilei`.`azienda`.`natura` = `datigalilei`.`azienda_tipo`.`id`))) on((`datigalilei`.`slot`.`idAzienda` = `datigalilei`.`azienda`.`idAz`))) join `datigalilei`.`tirocinio` on((`datigalilei`.`slot`.`idtirocinio` = `datigalilei`.`tirocinio`.`idT`))) on((`datigalilei`.`studente`.`CODICE FISCALE` = `datigalilei`.`tirocinio`.`idStud`))) on((`datigalilei`.`docente`.`cf` = `datigalilei`.`tirocinio`.`tutor`))) join `datigalilei`.`slottipo` on((`datigalilei`.`slot`.`tipo` = `datigalilei`.`slottipo`.`id`))) join `datigalilei`.`slotimpiego` on((`datigalilei`.`slot`.`impiego` = `datigalilei`.`slotimpiego`.`id`))) on((`datigalilei`.`tut_tir`.`idTirocinio` = `datigalilei`.`tirocinio`.`idT`))) join `datigalilei`.`tutor` on(((`datigalilei`.`azienda`.`idAz` = `datigalilei`.`tutor`.`idA`) and (`datigalilei`.`tut_tir`.`idTutor` = `datigalilei`.`tutor`.`idT`)))) left join `datigalilei`.`comune` `comune_1` on((`comune_1`.`CodFisco` = `datigalilei`.`studente`.`CODICE COMUNE DI NASCITA`))) left join `datigalilei`.`tutorinquadr` on((`datigalilei`.`tutor`.`idInquad` = `datigalilei`.`tutorinquadr`.`idInquad`))) on((`comune_3`.`Istat` = `datigalilei`.`azienda`.`comune`))) left join `datigalilei`.`qiscritticertificati` on((`datigalilei`.`studente`.`CODICE FISCALE` = `qiscritticertificati`.`cf`))) join `datigalilei`.`studstorico` on(((`datigalilei`.`tirocinio`.`annos` = `datigalilei`.`studstorico`.`anno`) and (`datigalilei`.`studente`.`MATRICOLA` = `datigalilei`.`studstorico`.`idstu`)))) join `datigalilei`.`firma` on((`datigalilei`.`tirocinio`.`annos` = `datigalilei`.`firma`.`annos`))) order by `datigalilei`.`tirocinio`.`idT` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `qprgformativocollettivo`
--

/*!50001 DROP VIEW IF EXISTS `qprgformativocollettivo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`utente`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `qprgformativocollettivo` AS select `azienda`.`nome` AS `nomeaz`,`azienda_tipo`.`natura` AS `natura`,`comune`.`Comune` AS `Comune`,`comune`.`Provincia` AS `Provincia`,`comune`.`CAP` AS `CAP`,`azienda`.`ateco` AS `ateco`,`azienda`.`indirizzo_sl` AS `indirizzo_sl`,`azienda`.`cod_fiscale` AS `cod_fiscale`,`azienda`.`part_iva` AS `part_iva`,`azienda`.`leg_rapp_nome` AS `leg_rapp_nome`,`azienda`.`tel` AS `tel`,`azienda`.`mail` AS `mail`,`azienda`.`nproto` AS `nproto`,`azienda`.`dproto` AS `dproto`,`attivita`.`Annos` AS `Annos`,(`attivita`.`Annos` + 1) AS `annos1`,`attivita`.`IDAttivita` AS `IDAttivita`,`tutor`.`nome` AS `nomeTut`,`tutor`.`tel` AS `telTut`,`tutor`.`mail` AS `mailTut`,`tutorinquadr`.`descr` AS `inquadramento`,`tutor`.`ruolo` AS `ruolotut`,`attivita`.`Attivita` AS `Attivita`,`attivita`.`Note` AS `Note`,`attivita`.`NumOre` AS `NumOre`,`attivita`.`Referente` AS `Referente`,`attivita`.`Datai` AS `Datai`,`attivita`.`Dataf` AS `Dataf`,`attivita`.`dataPfc` AS `dataPfc`,`firma`.`dirigente` AS `dirigente`,`firma`.`assicurazione` AS `polizza` from (((`comune` `comune1` join ((`azienda` join `comune` on((`azienda`.`comune_sl` = `comune`.`Istat`))) left join `azienda_tipo` on((`azienda`.`natura` = `azienda_tipo`.`id`))) on((`comune1`.`Istat` = `azienda`.`comune`))) join (((`tutor` left join `tutorinquadr` on((`tutor`.`idInquad` = `tutorinquadr`.`idInquad`))) join `attivita_tutor` on((`tutor`.`idT` = `attivita_tutor`.`idTut`))) join `attivita` on((`attivita_tutor`.`idAtt` = `attivita`.`IDAttivita`))) on((`azienda`.`idAz` = `attivita`.`IdAz`))) join `firma` on((`attivita`.`Annos` = `firma`.`annos`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `qprgformativocollettivo_old`
--

/*!50001 DROP VIEW IF EXISTS `qprgformativocollettivo_old`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`utente`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `qprgformativocollettivo_old` AS select `azienda`.`nome` AS `nomeaz`,`azienda_tipo`.`natura` AS `natura`,`comune`.`Comune` AS `Comune`,`comune`.`Provincia` AS `Provincia`,`comune`.`CAP` AS `CAP`,`azienda`.`ateco` AS `ateco`,`azienda`.`indirizzo_sl` AS `indirizzo_sl`,`azienda`.`cod_fiscale` AS `cod_fiscale`,`azienda`.`part_iva` AS `part_iva`,`azienda`.`leg_rapp_nome` AS `leg_rapp_nome`,`azienda`.`tel` AS `tel`,`azienda`.`mail` AS `mail`,`azienda`.`nproto` AS `nproto`,`azienda`.`dproto` AS `dproto`,`attivita`.`Annos` AS `Annos`,(`attivita`.`Annos` + 1) AS `annos1`,`attivita`.`IDAttivita` AS `IDAttivita`,`studstorico`.`classe` AS `classe`,concat(`studente`.`COGNOME`,' ',`studente`.`NOME`) AS `studente`,`comune_1`.`Comune` AS `comuneN`,`studente`.`PROVINCIA DI NASCITA` AS `prN`,`studente`.`DATA DI NASCITA` AS `dataSt`,ifnull(`studente`.`INDIRIZZO 1`,`studente`.`INDIRIZZO 0`) AS `specializz`,`tutor`.`nome` AS `nomeTut`,`tutor`.`tel` AS `telTut`,`tutor`.`mail` AS `mailTut`,`tutorinquadr`.`descr` AS `inquadramento`,`tutor`.`ruolo` AS `ruolotut`,`attivita`.`Attivita` AS `Attivita`,`attivita`.`Note` AS `Note`,`attivita`.`NumOre` AS `NumOre`,`attivita`.`Referente` AS `Referente`,`attivita`.`Datai` AS `Datai`,`attivita`.`Dataf` AS `Dataf`,`attivita`.`dataPfc` AS `dataPfc`,`studente`.`CODICE FISCALE` AS `codf_St` from ((`comune` `comune_3` join ((`azienda` join `comune` on((`azienda`.`comune_sl` = `comune`.`Istat`))) left join `azienda_tipo` on((`azienda`.`natura` = `azienda_tipo`.`id`))) on((`comune_3`.`Istat` = `azienda`.`comune`))) join (((`studente` left join `comune` `comune_1` on((`comune_1`.`CodFisco` = `studente`.`CODICE COMUNE DI NASCITA`))) join `studstorico` on((`studente`.`MATRICOLA` = `studstorico`.`idstu`))) join (((`tutor` left join `tutorinquadr` on((`tutor`.`idInquad` = `tutorinquadr`.`idInquad`))) join `attivita_tutor` on((`tutor`.`idT` = `attivita_tutor`.`idTut`))) join (`attivita` join `attivita_studenti` on((`attivita`.`IDAttivita` = `attivita_studenti`.`IDAttivita`))) on((`attivita_tutor`.`idAtt` = `attivita`.`IDAttivita`))) on(((`studente`.`CODICE FISCALE` = `attivita_studenti`.`IDStudente`) and (`studstorico`.`anno` = `attivita`.`Annos`)))) on((`azienda`.`idAz` = `attivita`.`IdAz`))) group by `azienda`.`nome`,`azienda_tipo`.`natura`,`comune`.`Comune`,`comune`.`Provincia`,`comune`.`CAP`,`azienda`.`ateco`,`azienda`.`indirizzo_sl`,`azienda`.`cod_fiscale`,`azienda`.`part_iva`,`azienda`.`leg_rapp_nome`,`azienda`.`tel`,`azienda`.`mail`,`azienda`.`nproto`,`azienda`.`dproto`,`attivita`.`Annos`,(`attivita`.`Annos` + 1),`attivita`.`IDAttivita`,`studstorico`.`classe`,concat(`studente`.`COGNOME`,' ',`studente`.`NOME`),`comune_1`.`Comune`,`studente`.`PROVINCIA DI NASCITA`,`studente`.`DATA DI NASCITA`,ifnull(`studente`.`INDIRIZZO 1`,`studente`.`INDIRIZZO 0`),`attivita`.`Attivita`,`attivita`.`Note`,`attivita`.`NumOre`,`attivita`.`Referente`,`attivita`.`Datai`,`attivita`.`Dataf`,`attivita`.`dataPfc`,`studente`.`CODICE FISCALE` order by `studstorico`.`classe`,concat(`studente`.`COGNOME`,' ',`studente`.`NOME`) limit 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `qprogettoformativo`
--

/*!50001 DROP VIEW IF EXISTS `qprogettoformativo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`utente`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `qprogettoformativo` AS select `datigalilei`.`tirocinio`.`idT` AS `idT`,`datigalilei`.`azienda`.`nome` AS `nomea`,`datigalilei`.`azienda_tipo`.`natura` AS `natura`,`datigalilei`.`comune`.`Comune` AS `Comune`,`datigalilei`.`comune`.`Provincia` AS `Provincia`,`datigalilei`.`comune`.`CAP` AS `CAP`,`datigalilei`.`azienda`.`ateco` AS `ateco`,`datigalilei`.`azienda`.`indirizzo_sl` AS `indirizzo_sl`,`datigalilei`.`azienda`.`cod_fiscale` AS `cod_fiscale`,`datigalilei`.`azienda`.`part_iva` AS `part_iva`,`datigalilei`.`azienda`.`leg_rapp_nome` AS `leg_rapp_nome`,`datigalilei`.`azienda`.`tel` AS `tel`,`datigalilei`.`azienda`.`mail` AS `mail`,`datigalilei`.`azienda`.`nproto` AS `nproto`,`datigalilei`.`azienda`.`dproto` AS `dproto`,`datigalilei`.`studente`.`COGNOME` AS `COGNOME`,`datigalilei`.`studente`.`NOME` AS `NOME`,`comune_1`.`Comune` AS `comuneN`,`datigalilei`.`studente`.`PROVINCIA DI NASCITA` AS `PROVINCIA DI NASCITA`,`datigalilei`.`studente`.`DATA DI NASCITA` AS `DATA DI NASCITA`,`datigalilei`.`studente`.`VIA (INDIRIZZO) RESIDENZA` AS `VIA (INDIRIZZO) RESIDENZA`,`datigalilei`.`studente`.`CAP RESIDENZA` AS `CAP RESIDENZA`,`datigalilei`.`studente`.`PROVINCIA RESIDENZA` AS `PROVINCIA RESIDENZA`,`datigalilei`.`studente`.`CITTA' RESIDENZA` AS `comuneR`,`datigalilei`.`studente`.`CODICE FISCALE` AS `CODICE FISCALE`,`datigalilei`.`studente`.`CLASSE 0` AS `CLASSE 0`,if(isnull(`datigalilei`.`studente`.`INDIRIZZO 1`),`datigalilei`.`studente`.`SEZIONE 0`,`datigalilei`.`studente`.`SEZIONE 1`) AS `sez`,ifnull(`datigalilei`.`studente`.`INDIRIZZO 1`,`datigalilei`.`studente`.`INDIRIZZO 0`) AS `specializz`,`datigalilei`.`tirocinio`.`annos` AS `annos`,`datigalilei`.`tirocinio`.`dataPfi` AS `dataPfi`,(`datigalilei`.`tirocinio`.`annos` + 1) AS `annos1`,`datigalilei`.`docente`.`nominativo` AS `nomeDoc`,`datigalilei`.`docente`.`mail` AS `mailDoc`,`datigalilei`.`docente`.`cell` AS `cellDoc`,`datigalilei`.`tutor`.`nome` AS `nomeTut`,`datigalilei`.`tutor`.`tel` AS `telTut`,`datigalilei`.`tutor`.`mail` AS `mailTut`,`datigalilei`.`tutorinquadr`.`descr` AS `inquadramento`,`datigalilei`.`tutor`.`ruolo` AS `ruolo`,`datigalilei`.`slot`.`attivita` AS `lavoro`,`datigalilei`.`slot`.`datai` AS `datai`,`datigalilei`.`slot`.`dataf` AS `dataf`,`datigalilei`.`slot`.`oreprev` AS `oreprev`,`datigalilei`.`slottipo`.`descrizione` AS `descrizione`,`datigalilei`.`slotimpiego`.`attivita` AS `attivita`,`datigalilei`.`azienda`.`indirizzo` AS `indirizzo`,`comune_3`.`Comune` AS `comuneOp`,`comune_3`.`Provincia` AS `prOp`,`comune_3`.`CAP` AS `capOp`,`datigalilei`.`studente`.`COGNOME PARENTE 0` AS `COGNOME PARENTE 0`,`datigalilei`.`studente`.`NOME PARENTE 0` AS `NOME PARENTE 0`,`datigalilei`.`studente`.`CODICE FISCALE 0` AS `CODICE FISCALE 0`,`datigalilei`.`studente`.`DATA NASCITA PARENTE 0` AS `DATA NASCITA PARENTE 0`,`datigalilei`.`studente`.`LUOGO NASCITA PARENTE 0` AS `LUOGO NASCITA PARENTE 0`,`datigalilei`.`studente`.`CAP NASCITA PARENTE 0` AS `CAP NASCITA PARENTE 0`,`datigalilei`.`studente`.`PROVINCIA NASCITA PARENTE 0` AS `PROVINCIA NASCITA PARENTE 0`,`datigalilei`.`studente`.`DESCRIZIONE STATO DI NASCITA` AS `statoestero`,`datigalilei`.`studente`.`TELEFONO` AS `TELEFONO`,`datigalilei`.`studente`.`CELLULARE 1` AS `cellGen`,`datigalilei`.`studente`.`CELLULARE ALLIEVO` AS `cellSt`,if((locate('dominio.it',`datigalilei`.`studente`.`EMAIL 1`) <> 0),'',`datigalilei`.`studente`.`EMAIL 1`) AS `mailSt`,`qiscritticertificati`.`gendt` AS `gendt`,`qiscritticertificati`.`genn` AS `genn`,`qiscritticertificati`.`gene` AS `gene`,`qiscritticertificati`.`basdt` AS `basdt`,`qiscritticertificati`.`basn` AS `basn`,`qiscritticertificati`.`base` AS `base`,`qiscritticertificati`.`meddt` AS `meddt`,`qiscritticertificati`.`medn` AS `medn`,`qiscritticertificati`.`mede` AS `mede`,`qiscritticertificati`.`altdt` AS `altdt`,`qiscritticertificati`.`altn` AS `altn`,`qiscritticertificati`.`alte` AS `alte` from ((`datigalilei`.`comune` `comune_3` join ((((`datigalilei`.`tut_tir` join (((`datigalilei`.`docente` join (`datigalilei`.`studente` join ((`datigalilei`.`slot` join ((`datigalilei`.`azienda` join `datigalilei`.`comune` on((`datigalilei`.`azienda`.`comune_sl` = `datigalilei`.`comune`.`Istat`))) left join `datigalilei`.`azienda_tipo` on((`datigalilei`.`azienda`.`natura` = `datigalilei`.`azienda_tipo`.`id`))) on((`datigalilei`.`slot`.`idAzienda` = `datigalilei`.`azienda`.`idAz`))) join `datigalilei`.`tirocinio` on((`datigalilei`.`slot`.`idtirocinio` = `datigalilei`.`tirocinio`.`idT`))) on((`datigalilei`.`studente`.`CODICE FISCALE` = `datigalilei`.`tirocinio`.`idStud`))) on((`datigalilei`.`docente`.`cf` = `datigalilei`.`tirocinio`.`tutor`))) join `datigalilei`.`slottipo` on((`datigalilei`.`slot`.`tipo` = `datigalilei`.`slottipo`.`id`))) join `datigalilei`.`slotimpiego` on((`datigalilei`.`slot`.`impiego` = `datigalilei`.`slotimpiego`.`id`))) on((`datigalilei`.`tut_tir`.`idTirocinio` = `datigalilei`.`tirocinio`.`idT`))) join `datigalilei`.`tutor` on(((`datigalilei`.`tut_tir`.`idTutor` = `datigalilei`.`tutor`.`idT`) and (`datigalilei`.`azienda`.`idAz` = `datigalilei`.`tutor`.`idA`)))) left join `datigalilei`.`comune` `comune_1` on((`comune_1`.`CodFisco` = `datigalilei`.`studente`.`CODICE COMUNE DI NASCITA`))) left join `datigalilei`.`tutorinquadr` on((`datigalilei`.`tutor`.`idInquad` = `datigalilei`.`tutorinquadr`.`idInquad`))) on((`comune_3`.`Istat` = `datigalilei`.`azienda`.`comune`))) left join `datigalilei`.`qiscritticertificati` on((`datigalilei`.`studente`.`CODICE FISCALE` = `qiscritticertificati`.`cf`))) order by `datigalilei`.`studente`.`CLASSE 0`,if(isnull(`datigalilei`.`studente`.`INDIRIZZO 1`),`datigalilei`.`studente`.`SEZIONE 0`,`datigalilei`.`studente`.`SEZIONE 1`),`datigalilei`.`studente`.`COGNOME`,`datigalilei`.`studente`.`NOME` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `qriassuntostudenti`
--

/*!50001 DROP VIEW IF EXISTS `qriassuntostudenti`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`utente`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `qriassuntostudenti` AS select concat(`datigalilei`.`studente`.`CLASSE 0`,ifnull(`datigalilei`.`studente`.`SEZIONE 1`,`datigalilei`.`studente`.`SEZIONE 0`)) AS `classe`,`datigalilei`.`studente`.`COGNOME` AS `COGNOME`,`datigalilei`.`studente`.`NOME` AS `NOME`,`qiscrittisituazione`.`cf` AS `cf`,`qiscrittisituazione`.`gendt` AS `gendt`,`qiscrittisituazione`.`genn` AS `genn`,`qiscrittisituazione`.`gene` AS `gene`,`qiscrittisituazione`.`basdt` AS `basdt`,`qiscrittisituazione`.`basn` AS `basn`,`qiscrittisituazione`.`base` AS `base`,`qiscrittisituazione`.`meddt` AS `meddt`,`qiscrittisituazione`.`medn` AS `medn`,`qiscrittisituazione`.`mede` AS `mede`,`qiscrittisituazione`.`altdt` AS `altdt`,`qiscrittisituazione`.`altn` AS `altn`,`qiscrittisituazione`.`alte` AS `alte` from (`datigalilei`.`studente` join `datigalilei`.`qiscrittisituazione` on((`datigalilei`.`studente`.`CODICE FISCALE` = `qiscrittisituazione`.`cf`))) where (`datigalilei`.`studente`.`CLASSE 0` is not null) order by concat(`datigalilei`.`studente`.`CLASSE 0`,ifnull(`datigalilei`.`studente`.`SEZIONE 1`,`datigalilei`.`studente`.`SEZIONE 0`)),`datigalilei`.`studente`.`COGNOME`,`datigalilei`.`studente`.`NOME` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `qstudentestorico`
--

/*!50001 DROP VIEW IF EXISTS `qstudentestorico`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`master`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `qstudentestorico` AS select `studstorico`.`idstu` AS `idstu`,`studstorico`.`anno` AS `anno`,group_concat(`studstorico`.`classe` separator ',') AS `classi`,`studstorico`.`stato` AS `stato`,`studstorico`.`dal` AS `dal`,`studstorico`.`valido` AS `valido` from `studstorico` group by `studstorico`.`anno`,`studstorico`.`idstu` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `qtrainingcertificati`
--

/*!50001 DROP VIEW IF EXISTS `qtrainingcertificati`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`master`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `qtrainingcertificati` AS select `docente`.`nominativo` AS `nominativo`,`docente`.`cf` AS `cf`,`docente`.`luogo` AS `luogo`,`docente`.`datan` AS `datan`,`training`.`datai` AS `datai`,`training`.`dataf` AS `dataf`,`training_iscritti`.`orepres` AS `orepres`,`training_iscritti`.`datac` AS `datac`,`training_iscritti`.`numero` AS `numero`,`training`.`idtipo` AS `idtipo`,`training`.`idmodo` AS `idmodo`,`training`.`ore` AS `ore`,`training_iscritti`.`id` AS `id`,`training_tipo`.`descr` AS `descr`,`training_tipo`.`doc` AS `doc`,`training_tipo`.`prefisso` AS `prefisso`,`training`.`annos` AS `annos`,`training`.`descr` AS `nomecorso`,`docente`.`ente` AS `ente`,`docente_tipo`.`tipo` AS `tipo`,`training`.`sede` AS `sede`,`docente_corso`.`nominativo` AS `relatore`,`training`.`enteEsterno` AS `enteEsterno` from ((`training_tipo` join (((`training_iscritti` join `training` on((`training_iscritti`.`idtraining` = `training`.`idtraining`))) join `docente` on((`training_iscritti`.`idcorsista` = `docente`.`cf`))) join `docente_tipo` on((`docente`.`tipo` = `docente_tipo`.`idD`))) on((`training_tipo`.`idtipo` = `training`.`idtipo`))) left join `docente` `docente_corso` on((`training`.`docente` = `docente_corso`.`cf`))) where ((`training_iscritti`.`numero` <> '') and (`training_iscritti`.`firma` = 0)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-11-20 15:21:33
