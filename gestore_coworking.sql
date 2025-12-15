CREATE DATABASE coworking_db;
USE coworking_db;

CREATE TABLE utente(
	id_utente CHAR (16),
    nome VARCHAR (255),
    cognome VARCHAR (255),
    mail VARCHAR (321),
    
    PRIMARY KEY (id_utente),
    UNIQUE (mail)
);
CREATE TABLE sala(

	id_sala CHAR (16),
	nome VARCHAR (255),
    capienza INT,
    
    PRIMARY KEY (id_sala),
    UNIQUE (nome)
);

CREATE TABLE prenotazione(
	id_prenotazione CHAR (16),
    id_utente CHAR (16),
    id_sala CHAR (16),
    giorno DATE,
    inizio TIME,
    fine TIME,
    
    PRIMARY KEY (id_prenotazione),
    FOREIGN KEY (id_utente) REFERENCES utente(id_utente),
    FOREIGN KEY (id_sala) REFERENCES sala(id_sala),
    
    UNIQUE (id_sala, giorno, inizio)
);

CREATE TABLE servizio(
	id_servizio CHAR (16),
    nome VARCHAR (255),
    prezzo DECIMAL (5, 2),
    
    PRIMARY KEY (id_servizio)
);

CREATE TABLE servizio_utente(
	id_servizio CHAR (16),
    id_utente CHAR (16),
    
    PRIMARY KEY (id_utente, id_servizio),
    FOREIGN KEY (id_servizio) REFERENCES servizio(id_servizio),
    FOREIGN KEY (id_utente) REFERENCES utente(id_utente)
);
