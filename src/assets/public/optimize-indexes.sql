-- ============================================================
-- SCRIPT DI OTTIMIZZAZIONE INDICI DATABASE
-- ============================================================
-- Questo script aggiunge indici alle colonne più utilizzate
-- per velocizzare le query di lettura

-- Indici per la tabella SLOT (usata per la paginazione)
ALTER TABLE slot ADD INDEX idx_azienda (idAzienda);
ALTER TABLE slot ADD INDEX idx_anno_scolastico (annoScolastico);
ALTER TABLE slot ADD INDEX idx_tirocinio (idtirocinio);
ALTER TABLE slot ADD INDEX idx_creatore (idCreatore);

-- Indici per la tabella STUDENTE
ALTER TABLE studente ADD INDEX idx_matricola (matricola);
ALTER TABLE studente ADD INDEX idx_cognome_nome (cognome, nome);
ALTER TABLE studente ADD INDEX idx_classe1 (Classe1);

-- Indici per la tabella DOCENTE
ALTER TABLE docente ADD INDEX idx_nominativo (nominativo);
ALTER TABLE docente ADD INDEX idx_esterno (esterno);

-- Indici per la tabella CORSO
ALTER TABLE corso ADD INDEX idx_anno_scolastico (annoScolastico);
ALTER TABLE corso ADD INDEX idx_docente (docente);
ALTER TABLE corso ADD INDEX idx_tipo (idtipo);

-- Indici per la tabella AZIENDA
ALTER TABLE azienda ADD INDEX idx_nome (nome);
ALTER TABLE azienda ADD INDEX idx_comune (comune);
ALTER TABLE azienda ADD INDEX idx_attiva (attiva);

-- Indici per la tabella TIROCINIO
ALTER TABLE tirocinio ADD INDEX idx_anno_scolastico (annoScolastico);
ALTER TABLE tirocinio ADD INDEX idx_azienda (idAzienda);

-- Per verificare gli indici creati:
-- SHOW INDEX FROM slot;
-- SHOW INDEX FROM studente;
-- ecc...

-- Per analizzare le prestazioni:
-- EXPLAIN SELECT * FROM slot LIMIT 100 OFFSET 0;
