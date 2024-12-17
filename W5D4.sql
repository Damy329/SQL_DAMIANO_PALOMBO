CREATE DATABASE Calcio;
USE calcio;
-- CREAZIONE TABELLA SQUADRA
CREATE TABLE IF NOT EXISTS Squadra (
nome_squadra varchar (50) not null unique,
città varchar (70) not null,
numero_matricola int not null AUTO_INCREMENT, 
CONSTRAINT PK_numero_matricola PRIMARY KEY (numero_matricola)
);
-- CREAZIONE TABELLA GIOCATORE
CREATE TABLE IF NOT EXISTS Giocatore (
nome_cognome varchar (100) not null,
Squadra_attuale varchar (50) not null unique,
ruolo_ideale varchar (50) not null,
numero_tesseramento int not null AUTO_INCREMENT,
CONSTRAINT PK_numero_tesseramento PRIMARY KEY (numero_tesseramento),
CONSTRAINT FK_Squadra_Giocatore FOREIGN KEY (Squadra_attuale) REFERENCES Squadra (nome_squadra)
);
-- CREAZIONE TABELLA ALLENATORE
CREATE TABLE Allenatore(
nome_cognome varchar (100) not null,
età int not null,
Squadra_attuale varchar (50) not null,
numero_tesseramento int not null AUTO_INCREMENT,
CONSTRAINT PK_numero_tesseramento PRIMARY KEY (numero_tesseramento),
CONSTRAINT FK_Squadra_Allenatore FOREIGN KEY (Squadra_attuale) REFERENCES Squadra (nome_squadra)
);
-- CREAZIONE TABELLA SERIE
CREATE TABLE IF NOT EXISTS  Serie (
nome_serie varchar (50) not null,
Squadre_partecipanti varchar (100) not null unique,
girone varchar (20) not null default 'unico',
CONSTRAINT PK_squadre_partecipanti PRIMARY KEY (Squadre_partecipanti),
CONSTRAINT FK_Squadra_serie FOREIGN KEY (Squadre_partecipanti) REFERENCES Squadra (nome_squadra)
);
-- POPOLAMENTO TABELLA SQUADRA
INSERT INTO
 Squadra (nome_squadra, città)
VALUES 
('Juventus', 'Torino'),
('Milan', 'Milano'),
('Inter', 'Milano'),
('Roma', 'Roma'),
('Napoli', 'Napoli'),
('Lazio', 'Roma'),
('Fiorentina', 'Firenze'),
('Atalanta', 'Bergamo'),
('Torino', 'Torino'),
('Sassuolo', 'Sassuolo');
-- POPOLAMENTO TABELLA GIOCATORE
INSERT INTO Giocatore (nome_cognome, squadra_attuale, ruolo_ideale)
VALUES 
('Federico Chiesa', 'Juventus', 'Attaccante'),
('Olivier Giroud', 'Milan', 'Attaccante'),
('Lautaro Martinez', 'Inter', 'Attaccante'),
('Paulo Dybala', 'Roma', 'Trequartista'),
('Victor Osimhen', 'Napoli', 'Attaccante'),
('Ciro Immobile', 'Lazio', 'Attaccante'),
('Nicolas Gonzalez', 'Fiorentina', 'Ala'),
('Rasmus Hojlund', 'Atalanta', 'Attaccante'),
('Antonio Sanabria', 'Torino', 'Attaccante'),
('Domenico Berardi', 'Sassuolo', 'Ala');
-- POPOLAMENTO TABELLA ALLENATORE
INSERT INTO Allenatore (nome_cognome, età, squadra_attuale)
VALUES
('Massimiliano Allegri', 56, 'Juventus'),
('Stefano Pioli', 58, 'Milan'),
('Simone Inzaghi', 47, 'Inter'),
('Jose Mourinho', 61, 'Roma'),
('Rudi Garcia', 59, 'Napoli'),
('Maurizio Sarri', 64, 'Lazio'),
('Vincenzo Italiano', 45, 'Fiorentina'),
('Gian Piero Gasperini', 66, 'Atalanta'),
('Ivan Juric', 48, 'Torino'),
('Alessio Dionisi', 43, 'Sassuolo');
-- POPOLAMENTO TABELLA SERIE
INSERT INTO serie (nome_serie, squadre_partecipanti)
VALUES 
('Serie A', 'Juventus'),
('Serie A', 'Milan'),
('Serie A', 'Inter' ),
('Serie A', 'Roma'),
('Serie A', 'Napoli'),
('Serie A', 'Lazio'),
('Serie A', 'Fiorentina'),
('Serie A', 'Atalanta'),
('Serie A', 'Torino'),
('Serie A', 'Sassuolo');



