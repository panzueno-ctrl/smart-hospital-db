-- DML di modifica

-- Aggiornamento del capo_medico_id ora che i medici esistono

update reparto set capo_medico_id = 1 where reparto_id = 1;
update reparto set capo_medico_id = 2 where reparto_id = 2;
update reparto set capo_medico_id = 3 where reparto_id = 3;
update reparto set capo_medico_id = 4 where reparto_id = 4;
update reparto set capo_medico_id = 5 where reparto_id = 5;
update reparto set capo_medico_id = 6 where reparto_id = 6;
update reparto set capo_medico_id = 7 where reparto_id = 7;
update reparto set capo_medico_id = 8 where reparto_id = 8;
update reparto set capo_medico_id = 9 where reparto_id = 9;
update reparto set capo_medico_id = 10 where reparto_id = 10;


--Conferma prenotazione

update prenotazione set stato = 'CONFERMATA' where prenotazione_id = 1;
update prenotazione set stato = 'CONFERMATA' where prenotazione_id = 2;
update prenotazione set stato = 'CONFERMATA' where prenotazione_id = 3;
update prenotazione set stato = 'CONFERMATA' where prenotazione_id = 4;
update prenotazione set stato = 'CONFERMATA' where prenotazione_id = 5;
update prenotazione set stato = 'CONFERMATA' where prenotazione_id = 6;
update prenotazione set stato = 'CONFERMATA' where prenotazione_id = 7;
update prenotazione set stato = 'CONFERMATA' where prenotazione_id = 8;
update prenotazione set stato = 'CONFERMATA' where prenotazione_id = 9;
update prenotazione set stato = 'CONFERMATA' where prenotazione_id = 10;


--Chiusura di una visita

update visita set stato = 'CHIUSA', ended_at = '2026-04-01 8:30' where visita_id = 1;
update visita set stato = 'CHIUSA', ended_at = '2026-04-01 9:30' where visita_id = 2;
update visita set stato = 'CHIUSA', ended_at = '2026-04-01 10:30' where visita_id = 3;
update visita set stato = 'CHIUSA', ended_at = '2026-04-01 11:30' where visita_id = 4;
update visita set stato = 'CHIUSA', ended_at = '2026-04-01 12:30' where visita_id = 5;
update visita set stato = 'CHIUSA', ended_at = '2026-04-01 13:30' where visita_id = 6;
update visita set stato = 'CHIUSA', ended_at = '2026-04-01 14:30' where visita_id = 7;
update visita set stato = 'CHIUSA', ended_at = '2026-04-01 15:30' where visita_id = 8;
update visita set stato = 'CHIUSA', ended_at = '2026-04-01 16:30' where visita_id = 9;
update visita set stato = 'CHIUSA', ended_at = '2026-04-01 17:30' where visita_id = 10;


--Esame

update esame set stato = 'ESEGUITO', eseguito_il = '2026-04-02 8:30' where esame_id = 1;
update esame set stato = 'ESEGUITO', eseguito_il = '2026-04-02 8:30' where esame_id = 2;
update esame set stato = 'ESEGUITO', eseguito_il = '2026-04-02 8:30' where esame_id = 3;
update esame set stato = 'ESEGUITO', eseguito_il = '2026-04-02 8:30' where esame_id = 4;
update esame set stato = 'ESEGUITO', eseguito_il = '2026-04-02 8:30' where esame_id = 5;
update esame set stato = 'ESEGUITO', eseguito_il = '2026-04-02 8:30' where esame_id = 6;
update esame set stato = 'ESEGUITO', eseguito_il = '2026-04-02 8:30' where esame_id = 7;
update esame set stato = 'ESEGUITO', eseguito_il = '2026-04-02 8:30' where esame_id = 8;
update esame set stato = 'ESEGUITO', eseguito_il = '2026-04-02 8:30' where esame_id = 9;
update esame set stato = 'ESEGUITO', eseguito_il = '2026-04-02 8:30' where esame_id = 10;


--Validazione di una diagnosi

update diagnosi set stato = 'FINALE', validata_il = '2026-04-01 8:45' where diagnosi_id = 1;
update diagnosi set stato = 'FINALE', validata_il = '2026-04-01 8:45' where diagnosi_id = 2;
update diagnosi set stato = 'FINALE', validata_il = '2026-04-01 8:45' where diagnosi_id = 3;
update diagnosi set stato = 'FINALE', validata_il = '2026-04-01 8:45' where diagnosi_id = 4;
update diagnosi set stato = 'FINALE', validata_il = '2026-04-01 8:45' where diagnosi_id = 5;
update diagnosi set stato = 'FINALE', validata_il = '2026-04-01 8:45' where diagnosi_id = 6;
update diagnosi set stato = 'FINALE', validata_il = '2026-04-01 8:45' where diagnosi_id = 7;
update diagnosi set stato = 'FINALE', validata_il = '2026-04-01 8:45' where diagnosi_id = 8;
update diagnosi set stato = 'FINALE', validata_il = '2026-04-01 8:45' where diagnosi_id = 9;
update diagnosi set stato = 'FINALE', validata_il = '2026-04-01 8:45' where diagnosi_id = 10;


--Annullamento di una prenotazione

update prenotazione set stato = 'ANNULLATA' where prenotazione_id = 2;

update calendario_slot set stato = 'LIBERO' where slot_id = 2;


--Aggiunta di un nuovo paziente 

insert into paziente (codice_fiscale, nome, cognome, data_nascita, sesso, telefono, email, indirizzo, medico_base, note_cliniche_sint) values
('GLLMRC95A01F205Z','Marco','Gallo','1995-01-01','M','3391234567','marco.gallo@email.com','Via Verdi 5','Dott. Conti','Nessuna nota');


