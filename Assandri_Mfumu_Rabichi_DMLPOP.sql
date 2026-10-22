-- DML di popolamento di tutte le tabelle del database



insert into paziente (codice_fiscale, nome, cognome, data_nascita, sesso, telefono, email, indirizzo, medico_base, note_cliniche_sint) values
('RSSMRA85M01H501A','Mario','Rossi','1985-01-15','M','3331234567','mario.rossi@email.com','Via Roma 10','Dott. Bianchi','Nessuna nota'),
('VRNGNN90B22F205Z','Giovanna','Verdi','1990-02-22','F','3319876543','giovanna.verdi@email.com','Via Milano 23','Dott. Neri','Allergia lievissima'),
('BNCLTU78C15D612R','Luca','Bianchi','1978-03-15','M','3298765432','luca.bianchi@email.com','Via Napoli 8','Dott. Rossi','Diabete tipo 2'),
('FRSMRA92E01G402C','Francesca','Esposito','1992-05-01','F','3351239876','francesca.esposito@email.com','Via Torino 5','Dott. Ferrari','Ipertensione'),
('DGTMRA88H12L219X','Davide','Gatti','1988-08-12','M','3345678901','davide.gatti@email.com','Via Palermo 18','Dott. Moretti','Asma'),
('CLNRSS81S24M202Y','Clara','Russo','1981-09-24','F','3301122334','clara.russo@email.com','Via Firenze 12','Dott. Ricci','Nessuna nota'),
('MTNLNZ93D18F205A','Martina','Lanzoni','1993-04-18','F','3399988776','martina.lanzoni@email.com','Via Bologna 7','Dott. Sala','Emicrania cronica'),
('PRDNCL89A30C703L','Pietro','Nicolini','1989-11-30','M','3384455667','pietro.nicolini@email.com','Via Genova 20','Dott. Leone','Colesterolo alto'),
('VRSMRA86T21F205Z','Veronica','Rossi','1986-12-21','F','3375566778','veronica.rossi@email.com','Via Pisa 9','Dott. Bianchi','Nessuna nota'),
('LCNTMN80M10H501K','Lorenzo','Conti','1980-06-10','M','3362233445','lorenzo.conti@email.com','Via Bari 14','Dott. Neri','Fibrillazione atriale');

insert into reparto (nome, ubicazione, telefono, capo_medico_id, created_at, updated_at) values 
('Cardiologia','Piano 1 - Ala A - Edificio 1','0601234567',null,now(),now()),
('Neurologia','Piano 2 - Ala B - Edificio 1','0602345678',null,now(),now()),
('Pediatria','Piano 1 - Ala C - Edificio 2','0603456789',null,now(),now()),
('Ortopedia','Piano 3 - Ala A - Edificio 1','0604567890',null,now(),now()),
('Ginecologia','Piano 2 - Ala C - Edificio 2','0605678901',null,now(),now()),
('Dermatologia','Piano 1 - Ala D - Edificio 2','0606789012',null,now(),now()),
('Oculistica','Piano 2 - Ala A - Edificio 3','0607890123',null,now(),now()),
('Radiologia','Piano 3 - Ala B - Edificio 3','0608901234',null,now(),now()),
('Oncologia','Piano 4 - Ala C - Edificio 1','0609012345',null,now(),now()),
('Endocrinologia','Piano 2 - Ala D - Edificio 2','0600123456',null,now(),now());

insert into medico (matricola_medico, albo_numero, nome, cognome, specializzazione, reparto_id, email, telefono, attivo, created_at, updated_at) values
('MAT001',1234,'Alessandro','Bianchi','Cardiologia',1,'a.bianchi@ospedale.com','3331112233','Y',now(),now()),
('MAT002',2345,'Federica','Neri','Neurologia',2,'f.neri@ospedale.com','3331112234','Y',now(),now()),
('MAT003',3456,'Giuseppe','Rossi','Pediatria',3,'g.rossi@ospedale.com','3331112235','Y',now(),now()),
('MAT004',4567,'Laura','Esposito','Ortopedia',4,'l.esposito@ospedale.com','3331112236','Y',now(),now()),
('MAT005',5678,'Marco','Ferrari','Ginecologia',5,'m.ferrari@ospedale.com','3331112237','Y',now(),now()),
('MAT006',6789,'Chiara','Ricci','Dermatologia',6,'c.ricci@ospedale.com','3331112238','Y',now(),now()),
('MAT007',7890,'Davide','Sala','Oculistica',7,'d.sala@ospedale.com','3331112239','Y',now(),now()),
('MAT008',8901,'Elena','Leone','Radiologia',8,'e.leone@ospedale.com','3331112240','Y',now(),now()),
('MAT009',9012,'Simone','Gatti','Oncologia',9,'s.gatti@ospedale.com','3331112241','Y',now(),now()),
('MAT010',1011,'Martina','Moretti','Endocrinologia',10,'m.moretti@ospedale.com','3331112242','Y',now(),now());

insert into ambulatorio (reparto_id, nome, sede, specialita, created_at, updated_at) values 
(1,'Ambulatorio Cardio 1','Stanza 101','Cardiologia',now(),now()),
(2,'Ambulatorio Neuro 1','Stanza 201','Neurologia',now(),now()),
(3,'Ambulatorio Pediatria 1','Stanza 102','Pediatria',now(),now()),
(4,'Ambulatorio Orto 1','Stanza 301','Ortopedia',now(),now()),
(5,'Ambulatorio Ginec 1','Stanza 202','Ginecologia',now(),now()),
(6,'Ambulatorio Derm 1','Stanza 103','Dermatologia',now(),now()),
(7,'Ambulatorio Ocul 1','Stanza 203','Oculistica',now(),now()),
(8,'Ambulatorio Radio 1','Stanza 302','Radiologia',now(),now()),
(9,'Ambulatorio Onco 1','Stanza 303','Oncologia',now(),now()),
(10,'Ambulatorio Endo 1','Stanza 204','Endocrinologia',now(),now());

insert into visita_tipo (codice, descrizione, specialita, durata_minuti, codice_predefinito) values 
('VT001','Visita cardiologica','Cardiologia',30,null),
('VT002','Visita neurologica','Neurologia',45,null),
('VT003','Visita pediatrica','Pediatria',30,null),
('VT004','Visita ortopedica','Ortopedia',40,null),
('VT005','Visita ginecologica','Ginecologia',35,null),
('VT006','Visita dermatologica','Dermatologia',25,null),
('VT007','Visita oculistica','Oculistica',30,null),
('VT008','Visita radiologica','Radiologia',20,null),
('VT009','Visita oncologica','Oncologia',50,null),
('VT010','Visita endocrinologica','Endocrinologia',30,null);

insert into dizionario_diagnosi (codice, descrizione, sistema, attivo) values 
(1001,'Infarto miocardico acuto','ICD-10','Y'),
(1002,'Ictus ischemico','ICD-10','Y'),
(1003,'Polmonite batterica','ICD-10','Y'),
(1004,'Frattura femore','ICD-10','Y'),
(1005,'Diabete mellito tipo 2','ICD-10','Y'),
(1006,'Asma bronchiale','ICD-10','Y'),
(1007,'Emicrania','ICD-10','Y'),
(1008,'Ipertensione arteriosa','ICD-10','Y'),
(1009,'Sindrome ansiosa','ICD-10','Y'),
(1010,'Anemia sideropenica','ICD-10','Y');

insert into calendario_slot (ambulatorio_id, medico_id, tipo_slot, inizio, fine, stato, fonte, note) values 
(1,1,'MEDICO','2026-04-01 08:00','2026-04-01 08:30','LIBERO','GENERATO',''),
(2,2,'MEDICO','2026-04-01 09:00','2026-04-01 09:45','LIBERO','GENERATO',''),
(3,3,'MEDICO','2026-04-01 10:00','2026-04-01 10:30','LIBERO','GENERATO',''),
(4,4,'MEDICO','2026-04-01 11:00','2026-04-01 11:40','LIBERO','GENERATO',''),
(5,5,'MEDICO','2026-04-01 12:00','2026-04-01 12:35','LIBERO','GENERATO',''),
(6,6,'MEDICO','2026-04-01 13:00','2026-04-01 13:25','LIBERO','GENERATO',''),
(7,7,'MEDICO','2026-04-01 14:00','2026-04-01 14:30','LIBERO','GENERATO',''),
(8,8,'MEDICO','2026-04-01 15:00','2026-04-01 15:20','LIBERO','GENERATO',''),
(9,9,'MEDICO','2026-04-01 16:00','2026-04-01 16:50','LIBERO','GENERATO',''),
(10,10,'MEDICO','2026-04-01 17:00','2026-04-01 17:30','LIBERO','GENERATO','');

insert into utente_sistema (username, ruolo, medico_id, attivo) values 
('admin','AMMIN',null,'Y'),
('tec1','TECNICO',null,'Y'),
('medico1','MEDICO',1,'Y'),
('medico2','MEDICO',2,'Y'),
('medico3','MEDICO',3,'Y'),
('auditor','AUDITOR',null,'Y'),
('medico4','MEDICO',4,'Y'),
('medico5','MEDICO',5,'Y'),
('medico6','MEDICO',6,'Y'),
('medico7','MEDICO',7,'Y');

insert into caso_clinico (paziente_id, medico_responsabile_id, titolo, tipo, priorita, descrizione, gravita, stato, data_apertura, data_modifica, data_chiusura, note_chiusura) values
(1,1,'Caso Infarto','ACUTO','ALTA','Infarto miocardico acuto','GRAVE','APERTO','2026-04-01',null,null,null),
(2,2,'Caso Ictus','ACUTO','URGENTE','Ictus ischemico','GRAVE','APERTO','2026-04-01',null,null,null),
(3,3,'Polmonite','ACUTO','MEDIA','Polmonite batterica','MODERATA','APERTO','2026-04-01',null,null,null),
(4,4,'Frattura femore','ACUTO','ALTA','Frattura del femore','GRAVE','APERTO','2026-04-01',null,null,null),
(5,5,'Diabete','CRONICO','BASSA','Diabete mellito tipo 2','MODERATA','APERTO','2026-04-01',null,null,null),
(6,6,'Asma','CRONICO','MEDIA','Asma bronchiale','LIEVE','APERTO','2026-04-01',null,null,null),
(7,7,'Emicrania','CRONICO','BASSA','Emicrania ricorrente','LIEVE','APERTO','2026-04-01',null,null,null),
(8,8,'Ipertensione','CRONICO','MEDIA','Ipertensione arteriosa','MODERATA','APERTO','2026-04-01',null,null,null),
(9,9,'Sindrome ansiosa','FOLLOW UP','BASSA','Ansia persistente','LIEVE','APERTO','2026-04-01',null,null,null),
(10,10,'Anemia','FOLLOW UP','MEDIA','Anemia sideropenica','MODERATA','APERTO','2026-04-01',null,null,null);

insert into prenotazione (paziente_id, slot_id, visita_tipo_id, priorita, motivo, inizio, fine, stato, note) values 
(1,1,1,'ORDINARIA','Controllo annuale','2026-04-01 08:00','2026-04-01 08:30','CONFERMATA',''),
(2,2,2,'URGENTE','Mal di testa','2026-04-01 09:00','2026-04-01 09:45','CONFERMATA',''),
(3,3,3,'ORDINARIA','Febbre','2026-04-01 10:00','2026-04-01 10:30','CONFERMATA',''),
(4,4,4,'URGENTE','Dolore articolare','2026-04-01 11:00','2026-04-01 11:40','CONFERMATA',''),
(5,5,5,'ORDINARIA','Visita ginecologica','2026-04-01 12:00','2026-04-01 12:35','CONFERMATA',''),
(6,6,6,'URGENTE','Eruzione cutanea','2026-04-01 13:00','2026-04-01 13:25','CONFERMATA',''),
(7,7,7,'ORDINARIA','Controllo vista','2026-04-01 14:00','2026-04-01 14:30','CONFERMATA',''),
(8,8,8,'URGENTE','Radiografia','2026-04-01 15:00','2026-04-01 15:20','CONFERMATA',''),
(9,9,9,'ORDINARIA','Visita oncologica','2026-04-01 16:00','2026-04-01 16:50','CONFERMATA',''),
(10,10,10,'URGENTE','Controllo tiroide','2026-04-01 17:00','2026-04-01 17:30','CONFERMATA','');

insert into visita (prenotazione_id, caso_id, paziente_id, medico_id, ambulatorio_id, anamnesi, sintomi, esame_obiettivo, vitali_testo, stato, started_at, ended_at) values
(1,1,1,1,1,'Controllo annuale generale','Nessuno','Normale','36.6°C, 120/80','APERTA','2026-04-01 08:00',null),
(2,2,2,2,2,'Mal di testa improvviso','Cefalea intensa','Nessuna alterazione','36.8°C, 110/70','APERTA','2026-04-01 09:00',null),
(3,3,3,3,3,'Febbre e tosse','Tosse persistente','Congestione polmonare','38°C, 100/65','APERTA','2026-04-01 10:00',null),
(4,4,4,4,4,'Dolore articolare al ginocchio','Dolore forte','Artrite lieve','36.9°C, 115/75','APERTA','2026-04-01 11:00',null),
(5,5,5,5,5,'Visita ginecologica programmata','Nessuno','Nessuna alterazione','36.7°C, 120/80','APERTA','2026-04-01 12:00',null),
(6,6,6,6,6,'Eruzione cutanea','Rash diffuso','Nessuna alterazione','37°C, 118/78','APERTA','2026-04-01 13:00',null),
(7,7,7,7,7,'Controllo vista','Visione sfocata','Nessuna alterazione','36.6°C, 119/79','APERTA','2026-04-01 14:00',null),
(8,8,8,8,8,'Radiografia torace','Dolore toracico','Nessuna alterazione','36.8°C, 121/80','APERTA','2026-04-01 15:00',null),
(9,9,9,9,9,'Controllo oncologico','Nessuno','Nessuna alterazione','36.7°C, 122/82','APERTA','2026-04-01 16:00',null),
(10,10,10,10,10,'Controllo tiroide','Nessuno','Nessuna alterazione','36.5°C, 120/78','APERTA','2026-04-01 17:00',null);

insert into esame (visita_id, utente_id, tipo, codice_loinc, stato, programmato_per, eseguito_il, note) values
(1,null,'LABORATORIO','1234-5','PRESCRITTO','2026-04-02 08:00',null,''),
(2,null,'IMAGING','2345-6','PRESCRITTO','2026-04-02 09:00',null,''),
(3,null,'ALTRO',null,'PRESCRITTO','2026-04-02 10:00',null,''),
(4,null,'LABORATORIO','3456-7','PRESCRITTO','2026-04-02 11:00',null,''),
(5,null,'IMAGING','4567-8','PRESCRITTO','2026-04-02 12:00',null,''),
(6,null,'ALTRO',null,'PRESCRITTO','2026-04-02 13:00',null,''),
(7,null,'LABORATORIO','5678-9','PRESCRITTO','2026-04-02 14:00',null,''),
(8,null,'IMAGING','6789-0','PRESCRITTO','2026-04-02 15:00',null,''),
(9,null,'ALTRO',null,'PRESCRITTO','2026-04-02 16:00',null,''),
(10,null,'LABORATORIO','7890-1','PRESCRITTO','2026-04-02 17:00',null,'');

insert into referto (esame_id, autore_id, dati_strutturati, allegati, versione) values
(1,1,'Esito positivo','',1),
(2,2,'Esito negativo','',1),
(3,3,'In corso','',1),
(4,4,'Esito positivo','',1),
(5,5,'Esito negativo','',1),
(6,6,'In corso','',1),
(7,7,'Esito positivo','',1),
(8,8,'Esito negativo','',1),
(9,9,'In corso','',1),
(10,10,'Esito positivo','',1);

insert into diagnosi (visita_id, dizionario_diagnosi_id, descrizione, stato, autore_medico_id, validata_il, versione) values
(1,1,'Infarto miocardico acuto','PROVVISORIA',1,null,1),
(2,2,'Ictus ischemico','PROVVISORIA',2,null,1),
(3,3,'Polmonite batterica','PROVVISORIA',3,null,1),
(4,4,'Frattura femore','PROVVISORIA',4,null,1),
(5,5,'Diabete mellito tipo 2','PROVVISORIA',5,null,1),
(6,6,'Asma bronchiale','PROVVISORIA',6,null,1),
(7,7,'Emicrania','PROVVISORIA',7,null,1),
(8,8,'Ipertensione arteriosa','PROVVISORIA',8,null,1),
(9,9,'Sindrome ansiosa','PROVVISORIA',9,null,1),
(10,10,'Anemia sideropenica','PROVVISORIA',10,null,1);

insert into AI_suggerimento (visita_id, modello_versione, candidato_codice, candidato_descr, confidenza, spiegazione) values
(1,'v1.0','1001','Infarto miocardico acuto',0.95,'Rischio elevato per sintomi'),
(2,'v1.0','1002','Ictus ischemico',0.90,'Possibile episodio neurologico'),
(3,'v1.0','1003','Polmonite batterica',0.85,'Febbre e tosse persistente'),
(4,'v1.0','1004','Frattura femore',0.80,'Dolore intenso al femore'),
(5,'v1.0','1005','Diabete mellito tipo 2',0.75,'Livelli glicemici elevati'),
(6,'v1.0','1006','Asma bronchiale',0.70,'Respiro sibilante'),
(7,'v1.0','1007','Emicrania',0.65,'Mal di testa ricorrente'),
(8,'v1.0','1008','Ipertensione arteriosa',0.60,'Pressione elevata'),
(9,'v1.0','1009','Sindrome ansiosa',0.55,'Ansia continua'),
(10,'v1.0','1010','Anemia sideropenica',0.50,'Bassa emoglobina');

insert into AI_azione_medico (suggerimento_id, medico_id, azione, nota, data_azione) values
(1,1,'ACCETTA','Confermo','2026-04-01 08:30'),
(2,2,'ACCETTA','Confermo','2026-04-01 09:30'),
(3,3,'RIGETTA','Non rilevante','2026-04-01 10:30'),
(4,4,'MODIFICA','Revisione','2026-04-01 11:30'),
(5,5,'ACCETTA','Confermo','2026-04-01 12:30'),
(6,6,'ACCETTA','Confermo','2026-04-01 13:30'),
(7,7,'RIGETTA','Non rilevante','2026-04-01 14:30'),
(8,8,'MODIFICA','Revisione','2026-04-01 15:30'),
(9,9,'ACCETTA','Confermo','2026-04-01 16:30'),
(10,10,'ACCETTA','Confermo','2026-04-01 17:30');

insert into consenso (paziente_id, tipo, stato, valido_dal, valido_al, note) values
(1,'PRIVACY','CONCESSO','2025-01-01',null,''),
(2,'IA','CONCESSO','2025-01-01',null,''),
(3,'PRIVACY','CONCESSO','2025-01-01',null,''),
(4,'IA','CONCESSO','2025-01-01',null,''),
(5,'PRIVACY','CONCESSO','2025-01-01',null,''),
(6,'IA','CONCESSO','2025-01-01',null,''),
(7,'PRIVACY','CONCESSO','2025-01-01',null,''),
(8,'IA','CONCESSO','2025-01-01',null,''),
(9,'PRIVACY','CONCESSO','2025-01-01',null,''),
(10,'IA','CONCESSO','2025-01-01',null,'');

insert into log (entita, entita_id, azione, utente_id, created_at, diff_testo, ip) values
('paziente',1,'CREATE',1,now(),'','192.168.0.1'),
('paziente',2,'CREATE',2,now(),'','192.168.0.2'),
('paziente',3,'CREATE',3,now(),'','192.168.0.3'),
('paziente',4,'CREATE',4,now(),'','192.168.0.4'),
('paziente',5,'CREATE',5,now(),'','192.168.0.5'),
('paziente',6,'CREATE',6,now(),'','192.168.0.6'),
('paziente',7,'CREATE',7,now(),'','192.168.0.7'),
('paziente',8,'CREATE',8,now(),'','192.168.0.8'),
('paziente',9,'CREATE',9,now(),'','192.168.0.9'),
('paziente',10,'CREATE',10,now(),'','192.168.0.10');

insert into allegato_visita (visita_id, tipo, url, descrizione) values
(1,'PDF','/files/esame1.pdf','Esame del sangue'),
(2,'IMG','/files/rx2.jpg','Radiografia'),
(3,'ALTRO','/files/alt3.txt','Documento'),
(4,'PDF','/files/esame4.pdf','Esame clinico'),
(5,'IMG','/files/rx5.jpg','Ecografia'),
(6,'ALTRO','/files/alt6.txt','Referto'),
(7,'PDF','/files/esame7.pdf','Esame del sangue'),
(8,'IMG','/files/rx8.jpg','Radiografia torace'),
(9,'ALTRO','/files/alt9.txt','Documento'),
(10,'PDF','/files/esame10.pdf','Esame urine');

insert into contatti_emergenza (paziente_id, nome, cognome, priorita, relazione, telefono, email) values
(1,'Giulia','Rossi','PRINCIPALE','CONIUGE','3331110001','giulia.rossi@email.com'),
(2,'Marco','Verdi','PRINCIPALE','PADRE','3331110002','marco.verdi@email.com'),
(3,'Anna','Bianchi','PRINCIPALE','MADRE','3331110003','anna.bianchi@email.com'),
(4,'Luca','Esposito','PRINCIPALE','FRATELLO','3331110004','luca.esposito@email.com'),
(5,'Sara','Gatti','PRINCIPALE','SORELLA','3331110005','sara.gatti@email.com'),
(6,'Elena','Russo','PRINCIPALE','CONIUGE','3331110006','elena.russo@email.com'),
(7,'Simone','Lanzoni','PRINCIPALE','AMICO','3331110007','simone.lanzoni@email.com'),
(8,'Marta','Nicolini','PRINCIPALE','PARENTE','3331110008','marta.nicolini@email.com'),
(9,'Paolo','Rossi','PRINCIPALE','CONIUGE','3331110009','paolo.rossi@email.com'),
(10,'Chiara','Conti','PRINCIPALE','PARENTE','3331110010','chiara.conti@email.com');


