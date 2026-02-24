-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Feb 07, 2026 alle 09:02
-- Versione del server: 10.4.32-MariaDB
-- Versione PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fls`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `azienda`
--

CREATE TABLE `azienda` (
  `id` int(11) NOT NULL,
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
  `idDocente` int(11) DEFAULT NULL,
  `sportiva` bit(1) DEFAULT b'0',
  `inglese` bit(1) DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `azienda_tipo`
--

CREATE TABLE `azienda_tipo` (
  `id` int(11) NOT NULL,
  `natura` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dump dei dati per la tabella `azienda_tipo`
--

INSERT INTO `azienda_tipo` (`id`, `natura`) VALUES
(1, 'S.r.l.'),
(2, 'S.p.A.'),
(3, 'Società unipersonale'),
(4, 'Azienda Agricola'),
(5, '(nd)'),
(6, 'S.n.c.'),
(7, 'S.a.s'),
(8, 'S.r.l.s.'),
(9, 'Comune'),
(13, 'Fondazione'),
(14, 'Istituzione scolastica'),
(15, 'Associazione ONLUS'),
(16, 'Società cooperativa'),
(17, 'Società sportiva');

-- --------------------------------------------------------

--
-- Struttura della tabella `classi`
--

CREATE TABLE `classi` (
  `id` int(11) NOT NULL,
  `anno scolastico` int(11) NOT NULL,
  `indirizzo` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sezione` char(1) NOT NULL,
  `idCoordinatore` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `comune`
--

CREATE TABLE `comune` (
  `idComune` int(11) NOT NULL,
  `Istat` double DEFAULT NULL,
  `Comune` varchar(120) DEFAULT NULL,
  `Provincia` varchar(2) DEFAULT NULL,
  `Regione` varchar(5) DEFAULT NULL,
  `Prefisso` double DEFAULT NULL,
  `CAP` varchar(6) DEFAULT NULL,
  `CodFisco` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dump dei dati per la tabella `comune`
--

INSERT INTO `comune` (`idComune`, `Istat`, `Comune`, `Provincia`, `Regione`, `Prefisso`, `CAP`, `CodFisco`) VALUES
(1, 28001, 'Abano Terme', 'PD', 'VEN', 49, '35031', 'A001'),
(2, 98001, 'Abbadia Cerreto', 'LO', 'LOM', 371, '26834', 'A004'),
(3, 97001, 'Abbadia Lariana', 'LC', 'LOM', 341, '23821', 'A005'),
(4, 52001, 'Abbadia San Salvatore', 'SI', 'TOS', 577, '53021', 'A006'),
(5, 95001, 'Abbasanta', 'OR', 'SAR', 785, '9071', 'A007'),
(6, 68001, 'Abbateggio', 'PE', 'ABR', 85, '65020', 'A008'),
(7, 15002, 'Abbiategrasso', 'MI', 'LOM', 2, '20081', 'A010'),
(8, 47001, 'Abetone', 'PT', 'TOS', 573, '51021', 'A012'),
(9, 76001, 'Abriola', 'PZ', 'BAS', 971, '85010', 'A013'),
(10, 88001, 'Acate', 'RG', 'SIC', 932, '97011', 'A014'),
(11, 71001, 'Accadia', 'FG', 'PUG', 881, '71021', 'A015'),
(12, 4001, 'Acceglio', 'CN', 'PIE', 171, '12021', 'A016'),
(13, 77001, 'Accettura', 'MT', 'BAS', 835, '75011', 'A017'),
(14, 66001, 'Acciano', 'AQ', 'ABR', 864, '67020', 'A018'),
(15, 57001, 'Accumoli', 'RI', 'LAZ', 746, '2011', 'A019'),
(16, 76002, 'Acerenza', 'PZ', 'BAS', 971, '85011', 'A020'),
(17, 65001, 'Acerno', 'SA', 'CAM', 89, '84042', 'A023'),
(18, 63001, 'Acerra', 'NA', 'CAM', 81, '80011', 'A024'),
(19, 87001, 'Aci Bonaccorsi', 'CT', 'SIC', 95, '95020', 'A025'),
(20, 87002, 'Aci Castello', 'CT', 'SIC', 95, '95021', 'A026'),
(21, 87003, 'Aci Catena', 'CT', 'SIC', 95, '95022', 'A027')
-- --------------------------------------------------------

--
-- Struttura della tabella `corso`
--

CREATE TABLE `corso` (
  `id` int(11) NOT NULL,
  `idtipo` int(11) DEFAULT NULL,
  `idmodo` int(11) DEFAULT NULL,
  `annoScolastico` int(11) DEFAULT NULL,
  `descrizione` varchar(50) DEFAULT NULL,
  `data_inizio` datetime DEFAULT NULL,
  `data_fine` datetime DEFAULT NULL,
  `ore` int(11) DEFAULT NULL,
  `docente` varchar(16) DEFAULT NULL,
  `esterno` bit(1) DEFAULT b'0',
  `note` varchar(80) DEFAULT NULL,
  `enteEsterno` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `corso_iscritti`
--

CREATE TABLE `corso_iscritti` (
  `id` int(11) NOT NULL,
  `idcorso` int(11) DEFAULT NULL,
  `idiscritto` int(11) DEFAULT NULL,
  `orepres` int(11) DEFAULT NULL,
  `superato` bit(1) DEFAULT b'0',
  `supplettivo` bit(1) DEFAULT b'0',
  `voto` tinyint(4) DEFAULT NULL,
  `datac` datetime DEFAULT NULL,
  `numero` varchar(255) DEFAULT NULL,
  `firma` bit(1) DEFAULT b'0',
  `notifica` bit(1) DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `corso_modo`
--

CREATE TABLE `corso_modo` (
  `idmodo` int(11) NOT NULL,
  `descr` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `corso_tipo`
--

CREATE TABLE `corso_tipo` (
  `idtipo` int(11) NOT NULL,
  `descr` varchar(50) DEFAULT NULL,
  `ore` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `docente`
--

CREATE TABLE `docente` (
  `id` int(11) NOT NULL,
  `nominativo` varchar(80) DEFAULT NULL,
  `data_nascita` datetime DEFAULT NULL,
  `luogo` varchar(120) DEFAULT NULL,
  `cf` varchar(16) DEFAULT NULL,
  `indirizzo` varchar(255) DEFAULT NULL,
  `mail` varchar(50) DEFAULT NULL,
  `cell` varchar(15) DEFAULT NULL,
  `esterno` bit(1) DEFAULT b'0',
  `ente` varchar(255) DEFAULT NULL,
  `tipo` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `docente_tipo`
--

CREATE TABLE `docente_tipo` (
  `idD` int(11) NOT NULL,
  `tipo` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dump dei dati per la tabella `docente_tipo`
--

INSERT INTO `docente_tipo` (`idD`, `tipo`) VALUES
(0, 'Docente'),
(1, 'Assistente tecnico'),
(2, 'Assistente amministrativo'),
(3, 'Collaboratore scolastico');

-- --------------------------------------------------------

--
-- Struttura della tabella `famiglia`
--

CREATE TABLE `famiglia` (
  `id` int(11) NOT NULL,
  `grado parentela` varchar(256) NOT NULL,
  `nome` varchar(256) NOT NULL,
  `codice fiscale` varchar(256) NOT NULL,
  `data` date NOT NULL,
  `idNascita` int(11) NOT NULL,
  `idResidenza` int(11) NOT NULL,
  `telefono fisso` int(10) NOT NULL,
  `telefono personale` int(10) NOT NULL,
  `email` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `firma`
--

CREATE TABLE `firma` (
  `annoScolastico` int(11) NOT NULL,
  `dirigente` varchar(80) NOT NULL,
  `assicurazione` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dump dei dati per la tabella `firma`
--

INSERT INTO `firma` (`annoScolastico`, `dirigente`, `assicurazione`) VALUES
(2013, 'Prof.ssa Laura Parazzi', ''),
(2014, 'Prof.Angelo Bettinelli', ''),
(2015, 'Prof.Angelo Bettinelli', ''),
(2016, 'Prof.Angelo Bettinelli', ''),
(2017, 'Prof.Angelo Bettinelli', ''),
(2018, 'Prof.ssa Maria Grazia Crispiatico', ''),
(2019, 'Prof.ssa Maria Grazia Crispiatico', ''),
(2020, 'Prof.ssa Maria Grazia Crispiatico', ''),
(2021, 'Prof.ssa Paola Orini', 'AMBIENTE SCUOLA IW/2021/00006'),
(2022, 'Prof.ssa Paola Orini', 'Benacquista SicurezzaScuola ITBSTQ93251'),
(2023, 'Prof.ssa Paola ORINI', 'Benacquista SicurezzaScuola ITBSTQ93251'),
(2024, 'Prof.ssa Paola ORINI', 'Benacquista SicurezzaScuola ITBSTQ93251'),
(2025, 'Prof.ssa Paola ORINI', 'Benacquista SicurezzaScuola ITBSTQ41725'),
(2026, 'Prof.ssa Paola ORINI', 'Benacquista SicurezzaScuola ITBSTQ41725');

-- --------------------------------------------------------

--
-- Struttura della tabella `luogo`
--

CREATE TABLE `luogo` (
  `id` int(11) NOT NULL,
  `idcomune` int(11) NOT NULL,
  `indirizzo` varchar(256) NOT NULL,
  `città` varchar(256) NOT NULL,
  `stato` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `slot`
--

CREATE TABLE `slot` (
  `idS` int(11) NOT NULL,
  `idAzienda` int(11) DEFAULT NULL,
  `annoScolastico` smallint(6) DEFAULT NULL,
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
  `idCreatore` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `slotimpiego`
--

CREATE TABLE `slotimpiego` (
  `id` int(11) NOT NULL,
  `attivita` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dump dei dati per la tabella `slotimpiego`
--

INSERT INTO `slotimpiego` (`id`, `attivita`) VALUES
(1, 'Affiancamento personale'),
(2, 'Lavoro individuale'),
(3, 'Inserimento in gruppo di lavoro');

-- --------------------------------------------------------

--
-- Struttura della tabella `slottipo`
--

CREATE TABLE `slottipo` (
  `id` int(11) NOT NULL,
  `descrizione` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dump dei dati per la tabella `slottipo`
--

INSERT INTO `slottipo` (`id`, `descrizione`) VALUES
(1, 'Ufficio segreteria'),
(2, 'Ufficio tecnico'),
(3, 'Reparto produzione'),
(4, 'Magazzino'),
(5, 'Ufficio qualità'),
(6, 'Ufficio vendite'),
(7, 'Banco vendite'),
(8, 'Manutenzione'),
(9, 'Officina'),
(10, 'Ufficio'),
(11, '- da definire'),
(12, 'Laboratorio'),
(13, 'Lab.didattico');

-- --------------------------------------------------------

--
-- Struttura della tabella `studente`
--

CREATE TABLE `studente` (
  `id` int(11) NOT NULL,
  `cognome` varchar(256) NOT NULL,
  `nome` varchar(256) NOT NULL,
  `matricola` varchar(256) NOT NULL,
  `cittadinanza` varchar(256) NOT NULL,
  `sesso` varchar(256) NOT NULL,
  `data_nascita` date NOT NULL,
  `cellulare allievo` int(11) NOT NULL,
  `cellulare emergenza 1` int(10) NOT NULL,
  `cellulare emergenza 2` int(10) NOT NULL,
  `email 1` varchar(256) NOT NULL,
  `email 2` varchar(256) NOT NULL,
  `idResidenza` int(11) NOT NULL,
  `idNascita` int(11) NOT NULL,
  `idGenitore1` int(11) NOT NULL,
  `idGenitore2` int(11) NOT NULL,
  `idClasse1` int(11) NOT NULL,
  `nRegistro1` int(11) NOT NULL,
  `idCLasse2` int(11) DEFAULT NULL,
  `nRegistro2` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `studstorico`
--

CREATE TABLE `studstorico` (
  `idstu` smallint(6) DEFAULT NULL,
  `anno` smallint(6) DEFAULT NULL,
  `classe` varchar(8) DEFAULT NULL,
  `stato` varchar(10) DEFAULT NULL,
  `dal` datetime DEFAULT NULL,
  `valido` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `tirocinio`
--

CREATE TABLE `tirocinio` (
  `id` int(11) NOT NULL,
  `idStudente` int(11) DEFAULT NULL,
  `oreEffettuate` smallint(6) DEFAULT NULL,
  `classe` varchar(10) DEFAULT NULL,
  `annoScolastico` int(11) DEFAULT NULL,
  `tutor` int(11) DEFAULT NULL,
  `dataPfi` datetime DEFAULT NULL,
  `data_inizioEff` datetime DEFAULT NULL,
  `data_fineEff` datetime DEFAULT NULL,
  `giudizio` smallint(6) DEFAULT NULL,
  `valutazione` smallint(6) DEFAULT NULL,
  `invioMail` bit(1) DEFAULT b'0',
  `restpfi` bit(1) DEFAULT b'0',
  `restsva` bit(1) DEFAULT b'0',
  `restsvs` bit(1) DEFAULT b'0',
  `restffp` bit(1) DEFAULT b'0',
  `note` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `tirociniovoti`
--

CREATE TABLE `tirociniovoti` (
  `id` smallint(6) NOT NULL,
  `voto` varchar(20) DEFAULT NULL,
  `attivo` bit(1) DEFAULT b'1',
  `az_st` bit(1) DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `tutor`
--

CREATE TABLE `tutor` (
  `id` int(11) NOT NULL,
  `nome` varchar(80) DEFAULT NULL,
  `idA` int(11) DEFAULT NULL,
  `tel` varchar(15) DEFAULT NULL,
  `mail` varchar(80) DEFAULT NULL,
  `ruolo` varchar(100) DEFAULT NULL,
  `idInquad` int(11) DEFAULT NULL,
  `stato` bit(1) DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `tutorinquadr`
--

CREATE TABLE `tutorinquadr` (
  `idInquad` int(11) NOT NULL,
  `descr` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `tut_tir`
--

CREATE TABLE `tut_tir` (
  `id` int(11) NOT NULL,
  `idTutor` int(11) DEFAULT NULL,
  `idTirocinio` int(11) DEFAULT NULL,
  `dal` datetime DEFAULT NULL,
  `al` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `utente`
--

CREATE TABLE `utente` (
  `id` int(11) NOT NULL,
  `username` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `livello` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `weblog`
--

CREATE TABLE `weblog` (
  `id` int(11) NOT NULL,
  `userid` int(11) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `data` datetime DEFAULT NULL,
  `motivo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `azienda`
--
ALTER TABLE `azienda`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nome_UNIQUE` (`nome`),
  ADD KEY `idDocente` (`idDocente`);

--
-- Indici per le tabelle `azienda_tipo`
--
ALTER TABLE `azienda_tipo`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `classi`
--
ALTER TABLE `classi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idCoordinatore` (`idCoordinatore`);

--
-- Indici per le tabelle `comune`
--
ALTER TABLE `comune`
  ADD PRIMARY KEY (`idComune`);

--
-- Indici per le tabelle `corso`
--
ALTER TABLE `corso`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idtipo` (`idtipo`),
  ADD KEY `idmodo` (`idmodo`);

--
-- Indici per le tabelle `corso_iscritti`
--
ALTER TABLE `corso_iscritti`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idcorso` (`idcorso`),
  ADD KEY `idiscritto` (`idiscritto`);

--
-- Indici per le tabelle `corso_modo`
--
ALTER TABLE `corso_modo`
  ADD PRIMARY KEY (`idmodo`);

--
-- Indici per le tabelle `corso_tipo`
--
ALTER TABLE `corso_tipo`
  ADD PRIMARY KEY (`idtipo`);

--
-- Indici per le tabelle `docente`
--
ALTER TABLE `docente`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tipo` (`tipo`);

--
-- Indici per le tabelle `docente_tipo`
--
ALTER TABLE `docente_tipo`
  ADD PRIMARY KEY (`idD`);

--
-- Indici per le tabelle `famiglia`
--
ALTER TABLE `famiglia`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `firma`
--
ALTER TABLE `firma`
  ADD PRIMARY KEY (`annoScolastico`);

--
-- Indici per le tabelle `luogo`
--
ALTER TABLE `luogo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idcomune` (`idcomune`);

--
-- Indici per le tabelle `slot`
--
ALTER TABLE `slot`
  ADD KEY `idAzienda` (`idAzienda`),
  ADD KEY `idtirocinio` (`idtirocinio`),
  ADD KEY `impiego` (`impiego`),
  ADD KEY `tipo` (`tipo`);

--
-- Indici per le tabelle `slotimpiego`
--
ALTER TABLE `slotimpiego`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `slottipo`
--
ALTER TABLE `slottipo`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `studente`
--
ALTER TABLE `studente`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idGenitore1` (`idGenitore1`),
  ADD KEY `idGenitore2` (`idGenitore2`),
  ADD KEY `idNascita` (`idNascita`),
  ADD KEY `idResidenza` (`idResidenza`),
  ADD KEY `idClasse1` (`idClasse1`),
  ADD KEY `idCLasse2` (`idCLasse2`);

--
-- Indici per le tabelle `tirocinio`
--
ALTER TABLE `tirocinio`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idStudente` (`idStudente`),
  ADD KEY `tutor` (`tutor`);

--
-- Indici per le tabelle `tirociniovoti`
--
ALTER TABLE `tirociniovoti`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `tutor`
--
ALTER TABLE `tutor`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idInquad` (`idInquad`),
  ADD KEY `idA` (`idA`);

--
-- Indici per le tabelle `tutorinquadr`
--
ALTER TABLE `tutorinquadr`
  ADD PRIMARY KEY (`idInquad`);

--
-- Indici per le tabelle `tut_tir`
--
ALTER TABLE `tut_tir`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idTutor` (`idTutor`),
  ADD KEY `idTirocinio` (`idTirocinio`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `azienda`
--
ALTER TABLE `azienda`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `azienda_tipo`
--
ALTER TABLE `azienda_tipo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT per la tabella `classi`
--
ALTER TABLE `classi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `corso`
--
ALTER TABLE `corso`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `luogo`
--
ALTER TABLE `luogo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `slotimpiego`
--
ALTER TABLE `slotimpiego`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT per la tabella `slottipo`
--
ALTER TABLE `slottipo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT per la tabella `studente`
--
ALTER TABLE `studente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `tirocinio`
--
ALTER TABLE `tirocinio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `tirociniovoti`
--
ALTER TABLE `tirociniovoti`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `tutor`
--
ALTER TABLE `tutor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `tutorinquadr`
--
ALTER TABLE `tutorinquadr`
  MODIFY `idInquad` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `tut_tir`
--
ALTER TABLE `tut_tir`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `azienda`
--
ALTER TABLE `azienda`
  ADD CONSTRAINT `azienda_ibfk_1` FOREIGN KEY (`idDocente`) REFERENCES `docente` (`id`);

--
-- Limiti per la tabella `classi`
--
ALTER TABLE `classi`
  ADD CONSTRAINT `classi_ibfk_1` FOREIGN KEY (`idCoordinatore`) REFERENCES `docente` (`id`);

--
-- Limiti per la tabella `corso`
--
ALTER TABLE `corso`
  ADD CONSTRAINT `corso_ibfk_1` FOREIGN KEY (`idtipo`) REFERENCES `corso_tipo` (`idtipo`),
  ADD CONSTRAINT `corso_ibfk_2` FOREIGN KEY (`idmodo`) REFERENCES `corso_modo` (`idmodo`);

--
-- Limiti per la tabella `corso_iscritti`
--
ALTER TABLE `corso_iscritti`
  ADD CONSTRAINT `corso_iscritti_ibfk_1` FOREIGN KEY (`idcorso`) REFERENCES `corso` (`id`),
  ADD CONSTRAINT `corso_iscritti_ibfk_2` FOREIGN KEY (`idiscritto`) REFERENCES `studente` (`id`);

--
-- Limiti per la tabella `docente`
--
ALTER TABLE `docente`
  ADD CONSTRAINT `docente_ibfk_1` FOREIGN KEY (`tipo`) REFERENCES `docente_tipo` (`idD`);

--
-- Limiti per la tabella `luogo`
--
ALTER TABLE `luogo`
  ADD CONSTRAINT `luogo_ibfk_1` FOREIGN KEY (`idcomune`) REFERENCES `comune` (`idComune`);

--
-- Limiti per la tabella `slot`
--
ALTER TABLE `slot`
  ADD CONSTRAINT `slot_ibfk_1` FOREIGN KEY (`idAzienda`) REFERENCES `azienda` (`id`),
  ADD CONSTRAINT `slot_ibfk_2` FOREIGN KEY (`idtirocinio`) REFERENCES `tirocinio` (`id`),
  ADD CONSTRAINT `slot_ibfk_3` FOREIGN KEY (`impiego`) REFERENCES `slotimpiego` (`id`),
  ADD CONSTRAINT `slot_ibfk_4` FOREIGN KEY (`tipo`) REFERENCES `slottipo` (`id`);

--
-- Limiti per la tabella `studente`
--
ALTER TABLE `studente`
  ADD CONSTRAINT `studente_ibfk_1` FOREIGN KEY (`idGenitore1`) REFERENCES `famiglia` (`id`),
  ADD CONSTRAINT `studente_ibfk_2` FOREIGN KEY (`idGenitore2`) REFERENCES `famiglia` (`id`),
  ADD CONSTRAINT `studente_ibfk_3` FOREIGN KEY (`idNascita`) REFERENCES `comune` (`idComune`),
  ADD CONSTRAINT `studente_ibfk_4` FOREIGN KEY (`idResidenza`) REFERENCES `luogo` (`id`),
  ADD CONSTRAINT `studente_ibfk_5` FOREIGN KEY (`idClasse1`) REFERENCES `classi` (`id`),
  ADD CONSTRAINT `studente_ibfk_6` FOREIGN KEY (`idCLasse2`) REFERENCES `classi` (`id`);

--
-- Limiti per la tabella `tirocinio`
--
ALTER TABLE `tirocinio`
  ADD CONSTRAINT `tirocinio_ibfk_1` FOREIGN KEY (`idStudente`) REFERENCES `studente` (`id`),
  ADD CONSTRAINT `tirocinio_ibfk_2` FOREIGN KEY (`tutor`) REFERENCES `tutor` (`id`);

--
-- Limiti per la tabella `tutor`
--
ALTER TABLE `tutor`
  ADD CONSTRAINT `tutor_ibfk_1` FOREIGN KEY (`idInquad`) REFERENCES `tutorinquadr` (`idInquad`),
  ADD CONSTRAINT `tutor_ibfk_2` FOREIGN KEY (`idA`) REFERENCES `azienda` (`id`);

--
-- Limiti per la tabella `tut_tir`
--
ALTER TABLE `tut_tir`
  ADD CONSTRAINT `tut_tir_ibfk_1` FOREIGN KEY (`idTutor`) REFERENCES `tutor` (`id`),
  ADD CONSTRAINT `tut_tir_ibfk_2` FOREIGN KEY (`idTirocinio`) REFERENCES `tirocinio` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
