DROP DATABASE IF EXISTS exercices_sql;

CREATE DATABASE exercices_sql 
CHARACTER SET UTF8MB4 
COLLATE UTF8MB4_GENERAL_CI; 
USE exercices_sql;

-- Exercice 1.1 -- 
DROP TABLE if EXISTS utilisateurs;
CREATE TABLE utilisateurs (
id INT PRIMARY KEY,
username VARCHAR(255),
 email VARCHAR(255),
 PASSWORD VARCHAR(255)
 );
 
 -- Bonus : INSERT INTO utilisateurs (id, username, email, password) --
-- VALUES (1, 'john', 'john@email.com', 'pass123');-- 
-- INSERT INTO utilisateurs (id, username, email, password) --
 -- VALUES (1, 'jane', 'jane@email.com', 'pass456'); -- 
-- Erreur : Duplicate entry "1" for key 'PRIMARY'

-- Exercice 1.2 --
 DROP TABLE if EXISTS adherents;
 CREATE TABLE adherents (
 numero_licence INT PRIMARY KEY,
 nom VARCHAR(100),
 prenom VARCHAR(100),
 numero_telephone VARCHAR(20),
 date_dernier_paiement DATE 
 );
 
 INSERT INTO adherents (
 numero_licence,
 nom,
 prenom,
 numero_telephone,
 date_dernier_paiement
 )
 VALUES (
 12345,
 'Dupont',
 'Jean',
 '0611123416',
 '2026-11-01'
 );
 -- Question de reflexion : --
 
 -- Si le numero de licence est la cle primaire, le modifier peut poser des problemes,surtout si d'autres tables utilisent ce numero pour faire reference a l'adherent --
 
 -- Exercice 1.3 -- 
 DROP TABLE if EXISTS places_parking;
 CREATE TABLE places_parking (
 identifiant VARCHAR(20) PRIMARY KEY,
 louee BOOLEAN,
 adresse VARCHAR(255)
 );
 INSERT INTO places_parking (
 identifiant, louee, adresse
 )
 VALUES 
 ('A-03', FALSE, '10 rue de Paris');
 -- ('A-03', TRUE, '20 rue de Lyon') -- Test erreur doublon cle primaire -- 
 
 -- EXERCICE 1.4 -- 
 
 DROP TABLE IF EXISTS regions;
 CREATE TABLE regions (
 region_number INT NOT NULL,
 NAME VARCHAR(255) NOT NULL,
 surface_area INT 
 
 );
 ALTER TABLE regions
 ADD PRIMARY KEY (region_number);
 INSERT INTO regions (region_number, NAME, surface_area)
 VALUES (1, 'Normandie', 29906);
 -- SELECT * FROM regions; -- 
 
 -- Exercice 1.5 -- 
 DROP TABLE if EXISTS products; 
 CREATE TABLE products (
    name VARCHAR(255) NOT NULL,
    price DECIMAL(8, 2) NOT NULL,
    weight DECIMAL(6, 2) NOT NULL,
    reference VARCHAR(127) NOT NULL
);
ALTER TABLE products 
ADD PRIMARY KEY (REFERENCE);
INSERT INTO products (name, price, weight, REFERENCE)
VALUES ('Clavier', 49.99, 0.8, 'CLAV001');
-- SELECT * FROM products; -- 

-- Exercice 1.6 -- 
DROP TABLE if EXISTS movies;
CREATE TABLE movies (
    name VARCHAR(255) NOT NULL,
    category VARCHAR(255),
    eidr VARCHAR(255) NOT NULL
);
ALTER TABLE  movies
ADD PRIMARY KEY (eidr);
INSERT INTO movies (NAME, category, eidr)
VALUES ('Inception', 'Science-fiction', 'EIDR-TEST-001');
-- SELECT * FROM movies; -- 

-- NOT NULL -- 
DROP TABLE if EXISTS rendez_vous;
CREATE TABLE rendez_vous (
nom_complet VARCHAR(100) NOT NULL,
date_consultation DATE NOT NULL,
motif VARCHAR(255),
medecin VARCHAR(100)
);
INSERT INTO rendez_vous (nom_complet, date_consultation)
VALUES ('Jean Dupont', '2026-11-26'); 
 -- select * FROM rendez_vous -- 
 -- Si aucune information dans nom_complet / date-consultation = erreur -- 
 
 -- Exercice 1.2 -- 
 DROP TABLE if EXISTS products;
 CREATE TABLE products (
 REFERENCE VARCHAR(50) NOT NULL UNIQUE,
 DESCRIPTION VARCHAR(255) NOT NULL,
 prix DECIMAL(8,2),
 marque VARCHAR(100)
 );
 INSERT INTO products (REFERENCE, DESCRIPTION)
 VALUES ('REF001', 'Ballon de football');
  -- SELECT * FROM products; -- 
  
  -- Exercice 1.3 --
 
 DROP TABLE if EXISTS reservations_voyage;
 CREATE TABLE reservations_voyage (
 nom_voyageur VARCHAR(100) NOT NULL,
 numero_passeport VARCHAR (20) NOT NULL,
 options_restauration VARCHAR(50),
 commentaires TEXT 
 );
 INSERT INTO reservations_voyage (nom_voyageur, numero_passeport)
 VALUES ('Jean Dupont', 'FR123456');
  -- SELECT * FROM reservations_voyage -- 
  
  -- Exercice 1.4 -- 
  DROP TABLE if EXISTS eleve; 
  CREATE TABLE eleve (
    id INT PRIMARY KEY,
    prenom_nom VARCHAR(80) ,
    instrument_principal VARCHAR(40),
    niveau_actuel VARCHAR(30),
    professeur VARCHAR(80)
);
ALTER TABLE eleve
MODIFY prenom_nom VARCHAR(80) NOT NULL,
MODIFY instrument_principal VARCHAR(40) NOT NULl;
INSERT INTO eleve (id, prenom_nom, instrument_principal)
VALUES (1, 'Jean DUPONT', 'Piano');
 -- SELECT * FROM eleve -- 
 
 -- Exercice 1.5 -- 
 
 DROP TABLE if EXISTS reservation; 
 CREATE TABLE reservation (
    id INT PRIMARY KEY,
    voyageur VARCHAR(100),
    numero_passeport VARCHAR(20),
    options_restauration VARCHAR(50),
    commentaires TEXT
);
ALTER TABLE reservation
MODIFY voyageur VARCHAR(100) NOT NULL, 
MODIFY numero_passeport VARCHAR(20) NOT NULL;
INSERT INTO reservation (id, voyageur, numero_passeport)
VALUES(1, 'Jean Dupont', 'FR123456');
-- VALUES(1, NULL, 'FR123456'); -- Erreur voyageur et numero passeport sont obligatoire
-- SELECT * FROM reservation -- 

-- Exercice 1.6 -- 
DROP TABLE if EXISTS contact;
CREATE TABLE contact (
    id INT PRIMARY KEY,
    nom_complet VARCHAR(80),
    telephone VARCHAR(20),
    email VARCHAR(50),
    anniversaire DATE
);
ALTER TABLE contact
MODIFY nom_complet VARCHAR(80) NOT NULL,
MODIFY telephone VARCHAR(20) NOT NULL;
INSERT INTO contact (id, nom_complet, telephone) 
VALUES (
1, 'Jean Dupont', '0611123416');
 -- SELECT * FROM  contact; -- 