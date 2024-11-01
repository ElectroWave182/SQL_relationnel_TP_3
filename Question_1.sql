\i C:/Users/ecauss04/Downloads/Question_1.sql

DROP DATABASE IF EXISTS Projets;
CREATE DATABASE Projets ENCODING 'UTF8';

\c projets
SET DATESTYLE='DMY';


DROP TABLE IF EXISTS Site CASCADE;
DROP TABLE IF EXISTS Organisation CASCADE;
DROP TABLE IF EXISTS Defi CASCADE;
DROP TABLE IF EXISTS Equipe CASCADE;
DROP TABLE IF EXISTS Etudiant CASCADE;


CREATE TABLE Site
(
	nomSite VARCHAR (42)
	CONSTRAINT pkSite PRIMARY KEY,
	emailResponsable VARCHAR (42),
	nomResponsable VARCHAR (42),
	noTelResponsable VARCHAR (42),
	CONSTRAINT cknoTelResponsable CHECK (noTelResponsable LIKE '0%'),
	CONSTRAINT ckemailResponsable CHECK (emailResponsable LIKE '%@%')
);

CREATE TABLE Organisation
(
	nomOrganisation VARCHAR (42)
	CONSTRAINT pkOrganisation PRIMARY KEY,
	type VARCHAR (42),
	CONSTRAINT cktype CHECK (LOWER (type) LIKE 'association' OR LOWER (type) LIKE 'entreprise')
);

CREATE TABLE Defi
(
	nomDefi VARCHAR (42)
	CONSTRAINT pkDefi PRIMARY KEY,
	prix INT,
	lOrganisation VARCHAR (42)
	CONSTRAINT fkDefiOrganisation REFERENCES Organisation (nomOrganisation)
);

CREATE TABLE Equipe
(
	idEquipe INT
	CONSTRAINT pkEquipe PRIMARY KEY,
	nomEquipe VARCHAR (42),
	leDefi VARCHAR (42)
	CONSTRAINT fkEquipeDefi REFERENCES Defi (nomDefi)
	CONSTRAINT leDefi NOT NULL,
	leSite VARCHAR (42)
	CONSTRAINT fkEquipeSite REFERENCES Site (nomSite)
	CONSTRAINT leSite NOT NULL
);

CREATE SEQUENCE seq_equipe
OWNED BY Equipe.idEquipe
;

CREATE TABLE Etudiant
(
	email VARCHAR (42)
	CONSTRAINT pkEtudiant PRIMARY KEY,
	nom VARCHAR (42),
	prenom VARCHAR (42),
	lEquipe INT
	CONSTRAINT fkEtudiantEquipe REFERENCES Equipe (idEquipe)
	CONSTRAINT lEquipe NOT NULL,
	estChefDe INT
	CONSTRAINT fkEtudiantChef REFERENCES Equipe (idEquipe)
	CONSTRAINT estChefDe UNIQUE,
	leSite VARCHAR (42)
	CONSTRAINT fkEtudiantSite REFERENCES Site (nomSite)
	CONSTRAINT leSite NOT NULL,
	CONSTRAINT ckemail CHECK (email LIKE '%@%'),
	CONSTRAINT ckchef CHECK (estChefDe = lEquipe)
);

