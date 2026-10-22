-- DDL di creazione del database



create table PAZIENTE (
    paziente_id SERIAL,
    codice_fiscale varchar(16) not null,
    nome varchar(30) not null,
    cognome varchar(30) not null,
    data_nascita date not null,
    sesso char(1) not null,
    telefono varchar(30),
    email varchar(50) null,
    indirizzo varchar(50),
    medico_base varchar(50),
   /* consenso_trattamento_dati char(1) not null, */
   /* consenso_ia char(1) not null, */
    note_cliniche_sint varchar(100),
    constraint unique_codice_fiscale unique (codice_fiscale),
    constraint paziente_pk primary key (paziente_id),
    constraint check_sesso check (sesso in ('M', 'F', 'X')),
    constraint check_email check (email is null or email like '%@%.%'),
   /* constraint check_consenso_trattamento_dati check (consenso_trattamento_dati in ('Y', 'N')), */
   /*   constraint check_consenso_ia check (consenso_ia in ('Y', 'N')) */
);
 
create table reparto(
    reparto_id SERIAL,
    nome varchar(120) not null,
    ubicazione varchar(120) not null,
    telefono varchar(30) not null,
    capo_medico_id integer,
    created_at timestamp,
    updated_at timestamp,
    constraint unique_nome unique (nome),
    constraint reparto_pk primary key (reparto_id),
    constraint check_ubicazione check (ubicazione like 'Piano % - Ala % - Edificio %')
);

create table medico (
    medico_id SERIAL,
    matricola_medico varchar(20) not null,
    albo_numero integer not null,
    nome varchar(30) not null,
    cognome varchar(30) not null,
    specializzazione varchar(30) not null,
    reparto_id integer not null,
    email varchar(50) not null,
    telefono varchar(20),
    attivo char(1) not null,
    created_at timestamp,
    updated_at timestamp,
    constraint unique_matricola unique (matricola_medico),
    constraint medico_pk primary key (medico_id),
    constraint medico_fk_reparto foreign key (reparto_id) references reparto(reparto_id) on delete cascade,
    constraint check_email check (email like '%@%.%'),
    constraint check_attivo check (attivo in ('Y', 'N'))
    /* qua serve un trigger per verificare che specializzazione del medico corrisponde con nome reparto*/
); 

alter table reparto
add  constraint reparto_fk_medico foreign key (capo_medico_id) references medico(medico_id);

create table ambulatorio (
    ambulatorio_id SERIAL,
    reparto_id integer not null,
    nome varchar(120) not null,
    sede varchar(120) not null,
    specialita varchar(120),
    created_at timestamp,
    updated_at timestamp,
    constraint ambulatorio_unique_nome unique (nome),
    constraint unique_sede unique (reparto_id,sede),
    constraint ambulatorio_pk primary key (ambulatorio_id),
    constraint ambulatorio_fk_reparto foreign key (reparto_id) references reparto(reparto_id),
    constraint check_sede check (sede like 'Stanza %')
);

create table visita_tipo (
    visita_tipo_id SERIAL,
    codice varchar(30) not null,
    descrizione varchar(300),
    specialita varchar(120),
    durata_minuti integer,
    codice_predefinito integer,
    constraint unique_codice unique (codice),
    constraint visita_tipo_pk primary key (visita_tipo_id) 
);

create table dizionario_diagnosi (
    dizionario_diagnosi_id SERIAL,
    codice integer not null,
    descrizione varchar(500) not null,
    sistema varchar(20),
    attivo char(1) not null,
    constraint dizionario_diagnosi_unique_codice unique (codice),
    constraint dizionario_diagnosi_pk primary key (dizionario_diagnosi_id),
    constraint check_attivo check (attivo in ('Y', 'N'))
);

create table calendario_slot(
    slot_id SERIAL,
    ambulatorio_id integer not null,
    medico_id integer null, 
    tipo_slot varchar(20) not null,  
    inizio timestamp not null,
    fine timestamp not null,
    stato varchar(15) not null,
    fonte varchar(20) not null,
    note varchar(50),
    constraint unique_slot_ambulatorio unique (ambulatorio_id, inizio),
    constraint unique_slot_medico unique (ambulatorio_id, medico_id, inizio),
    constraint calendario_slot_pk primary key (slot_id),
    constraint calendario_slot_fk_ambulatorio_id foreign key ( ambulatorio_id) references  ambulatorio(ambulatorio_id),
    constraint calendario_slot_fk_medico_id foreign key ( medico_id) references  medico(medico_id),
    constraint check_stato check (stato in ('LIBERO', 'OCCUPATO', 'BLOCCATO')),
    constraint check_fonte check (fonte in ('GENERATO', 'MANUALE')),
    constraint check_slot check (fine > inizio),
    constraint check_slot_medico check ( (tipo_slot ='MEDICO' and medico_id is not null) or (tipo_slot = 'AMBULATORIO' and medico_id is null)),
    constraint check_tipo_slot check (tipo_slot in ('MEDICO', 'AMBULATORIO'))
    /*serve un trigger per verificare che un slot medico sia incluso o uguale al'intervallo del slot ambulatorio (médeco ⊆ ambulatorio)*/
    /*trigger impedire che un slot occupato possa essere riservato*/
);

create table utente_sistema (
    utente_id SERIAL,
    username varchar(100) not null,
    ruolo varchar(20) not null,
    medico_id integer null,
    attivo char(1) not null,
    constraint unique_username unique (username),
    constraint utente_sistema_pk primary key (utente_id),
    constraint utente_sistema_fk_medico foreign key (medico_id) references medico(medico_id),
    constraint check_ruolo check (ruolo in ('AMMIN', 'TECNICO', 'MEDICO', 'AUDITOR')),
    constraint check_attivo check (attivo in ('Y', 'N')),
    constraint check_medico_id check ((ruolo = 'MEDICO' and medico_id is not null) or (ruolo != 'MEDICO' and medico_id is null))
); 

create table prenotazione (
    prenotazione_id SERIAL,
    paziente_id integer not null,
    slot_id integer not null,
    visita_tipo_id integer not null,
    priorita varchar(20) not null,
    motivo varchar(500) not null,
    inizio timestamp not null,
    fine timestamp not null,
    stato varchar(15) not null,
    note varchar(50),
    constraint unique_prenotazione_slot unique(paziente_id, slot_id),
    constraint prenotazione_pk primary key (prenotazione_id),
    constraint prenotazione_fk_calendario_slot foreign key (slot_id) references calendario_slot(slot_id),
    constraint prenotazione_fk_paziente foreign key (paziente_id) references paziente(paziente_id),
    constraint prenotazione_fk_visita_tipo foreign key (visita_tipo_id) references visita_tipo(visita_tipo_id),
    constraint check_stato check (stato in ('CREATA', 'CONFERMATA', 'EROGATA', 'ANNULLATA')),
    constraint check_priorita check (priorita in ('ORDINARIA', 'URGENTE')),
    constraint check_orario check (fine > inizio)
    /*trigger per verificare che inizio-fine corrispondono a slot_medico*/
);

create table caso_clinico (
    caso_id SERIAL,
    paziente_id integer not null,
    medico_responsabile_id integer not null,
    titolo varchar(100) not null,
    tipo varchar(30) not null,
    priorita varchar(20) not null,
    descrizione varchar(4000) not null,
    gravita varchar(15) not null,
    stato varchar(15) not null,
    data_apertura timestamp not null,
    data_modifica timestamp null,
    data_chiusura timestamp null,
    note_chiusura varchar(500),
    constraint caso_clinico_pk primary key (caso_id),
    constraint caso_clinico_fk_medico foreign key (medico_responsabile_id) references medico(medico_id),
    constraint caso_clinico_fk_paziente foreign key (paziente_id) references paziente(paziente_id),
    constraint check_stato check (stato in ('APERTO', 'CHIUSO')),
    constraint check_gravita check (gravita in ('LIEVE', 'MODERATA', 'GRAVE')),
    constraint check_tipo check (tipo in ('ACUTO', 'CRONICO', 'FOLLOW UP')),
    constraint check_priorita check (priorita in ('BASSA', 'MEDIA', 'ALTA', 'URGENTE')),
    constraint check_data_chiusura check ((stato = 'APERTO' and data_chiusura is null) or (stato = 'CHIUSO' and data_chiusura is not null))
);

create table visita (
    visita_id SERIAL,
    prenotazione_id integer not null,
    caso_id integer not null,
    paziente_id integer not null,
    medico_id integer not null,
    ambulatorio_id integer not null,
    anamnesi varchar(4000) not null,
    sintomi varchar(2000),
    esame_obiettivo varchar(4000),
    vitali_testo varchar(50),
    stato  varchar(15) not null,
    started_at TIMESTAMP not null,
    ended_at TIMESTAMP null,
    constraint unique_visita_per_prenotazione unique (prenotazione_id),
    constraint visita_pk primary key (visita_id),
    constraint visita_fk_prenotazione foreign key (prenotazione_id) references prenotazione(prenotazione_id),
    constraint visita_fk_caso_clinico foreign key (caso_id) references caso_clinico(caso_id),
    constraint visita_fk_paziente foreign key (paziente_id) references paziente(paziente_id),
    constraint visita_fk_medico foreign key (medico_id) references medico(medico_id),
    constraint visita_fk_ambulatorio foreign key (ambulatorio_id) references ambulatorio(ambulatorio_id),
    constraint check_stato check (stato in ('APERTA', 'CHIUSA')),
    constraint check_orario check (ended_at is null or ended_at > started_at)
    /* trigger: Una visita puo esistare solo se la prenotazione è confermata*/
);

create table esame (
    esame_id SERIAL,
    visita_id integer not null,
    utente_id integer null,
    tipo varchar(80) not null,
    codice_loinc varchar(20) null,
    stato varchar(15) not null,
    programmato_per timestamp not null,
    eseguito_il timestamp null,
    note varchar(500),
    constraint esame_pk primary  key (esame_id),
    constraint esame_fk_utente_sistema foreign key (utente_id) references utente_sistema(utente_id),
    constraint esame_fk_visita foreign key (visita_id) references visita(visita_id),
    constraint check_tipo check (tipo in ('LABORATORIO', 'IMAGING', 'ALTRO')),
    constraint check_stato check (stato in ('PRESCRITTO', 'PROGRAMMATO', 'ESEGUITO', 'ANNULLATO'))
    /*trigger: per verificare che ruolo di utente id corrisponda a 'TECNICO'*/
);

create table referto (
    referto_id SERIAL,
    esame_id integer not null,
    autore_id  integer not null,
    dati_strutturati varchar(4000),
    allegati varchar(2048),
    versione integer not null,
    constraint unique_referto_per_esame unique (esame_id),
    constraint referto_pk primary  key (referto_id),
    constraint referto_fk_esame foreign key (esame_id) references esame(esame_id),
    constraint referto_fk_medico foreign key (autore_id) references medico(medico_id)
);

create table diagnosi (
    diagnosi_id SERIAL,
    visita_id integer not null,
    dizionario_diagnosi_id integer not null,
    descrizione varchar(50) not null,
    stato varchar(12) not null,
    autore_medico_id integer not null,
    validata_il timestamp  null,
    versione integer not null,
    constraint diagnosi_pk primary key (diagnosi_id),
    constraint diagnosi_fk_dizionario_diagnosi foreign key (dizionario_diagnosi_id) references dizionario_diagnosi(dizionario_diagnosi_id),
    constraint diagnosi_fk_visita foreign key (visita_id) references visita(visita_id),
    constraint diagnosi_fk_medico foreign key (autore_medico_id) references medico(medico_id),
    constraint check_stato check (stato in ('PROVVISORIA', 'FINALE'))
);

-- "Per ogni visita può esistere una sola diagnosi finale attiva"
/*
create unique index unique_diagnosi_finale
on diagnosi(visita_id)
WHERE stato = 'FINALE';
*/

create table AI_suggerimento (
    suggerimento_id SERIAL,
    visita_id integer not null,
    modello_versione varchar(40) not null,
    candidato_codice varchar(10) not null,
    candidato_descr varchar(1000) not null,
    confidenza decimal(4,3) not null,
    spiegazione varchar(2000) null,
    constraint unique_suggerimento unique (visita_id, candidato_codice, modello_versione),
    constraint AI_suggerimento_pk primary key (suggerimento_id),
    constraint AI_suggerimento_fk_visita foreign key (visita_id) references visita(visita_id),
    constraint check_confidenza check (confidenza >= 0 and confidenza <= 1)
);

create table AI_azione_medico (
    azione_id SERIAL,
    suggerimento_id integer not null,
    medico_id integer not null,
    azione varchar(10) not null,
    nota varchar(1000),
    data_azione timestamp not null,
    constraint AI_azione_medico_pk primary key (azione_id),
    constraint AI_azione_medico_fk_AI_suggerimento foreign key (suggerimento_id) references AI_suggerimento(suggerimento_id),
    constraint AI_azione_medico_fk_medico foreign key (medico_id) references medico(medico_id),
    constraint  check_azione check (azione in ('ACCETTA', 'RIGETTA', 'MODIFICA'))
);

create table consenso (
    consenso_id SERIAL,
    paziente_id integer not null,
    tipo varchar(20) not null,
    stato varchar(10) not null,
    valido_dal timestamp not null,
    valido_al timestamp null,
    note varchar(500),
    constraint unique_tipo_per_paziente unique (paziente_id, tipo, valido_dal),
    constraint consenso_pk primary key (consenso_id),
    constraint consenso_fk_paziente foreign key (paziente_id) references paziente(paziente_id),
    constraint check_tipo check (tipo in ('PRIVACY', 'IA')),
    constraint check_stato check (stato in ('CONCESSO', 'REVOCATO'))
);

create table log (
    log_id SERIAL,
    entita varchar(40) not null,
    entita_id integer not null,
    azione varchar(12) not null,
    utente_id integer null,
    created_at timestamp not null,
    diff_testo varchar(4000),
    ip varchar(39),
    constraint log_pk primary key (log_id),
    constraint log_fk_utente_sistema foreign key (utente_id) references  utente_sistema(utente_id),
    constraint check_azione check (azione in ('CREATE', 'READ', 'UPDATE', 'DELETE'))
);

create table allegato_visita (
    allegato_id SERIAL,
    visita_id integer not null,
    tipo varchar(40) not null,
    url varchar(2048) not null,
    descrizione varchar(500),
    constraint allegato_visita_pk primary key (allegato_id),
    constraint allegato_visita_fk_visita foreign key (visita_id) references visita(visita_id),
    constraint check_tipo check (tipo in ('PDF', 'IMG', 'ALTRO'))
);

create table contatti_emergenza (
    contatto_id SERIAL,
    paziente_id integer not null,
    nome varchar(30) not null,
    cognome varchar(30) not null,
    priorita varchar(15) not null,
    relazione varchar(50) not null,
    telefono varchar(30) not null,
    email varchar(50) ,
    constraint contatti_emergenza_pk primary key (contatto_id),
    constraint contatto_emergenza_fk_paziente foreign key (paziente_id) references paziente(paziente_id),
    constraint check_email check (email is null or email like '%@%.%'),
    constraint check_priorita check (priorita in ('PRINCIPALE', 'SECONDARIA')),
    constraint check_relazione check (relazione in ('PADRE', 'MADRE', 'FRATELLO', 'SORELLA', 'CONIUGE', 'PARENTE', 'AMICO', 'ALTRO'))
);

