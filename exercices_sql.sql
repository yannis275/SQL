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
SELECT * FROM products;  

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
 SELECT * FROM movies; 

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
  select * FROM rendez_vous;  
 -- Si aucune information dans nom_complet / date-consultation = erreur -- 
 
 -- Exercice 1.2 -- 
 DROP TABLE if EXISTS product_p;
 CREATE TABLE product_p (
 REFERENCE VARCHAR(50) NOT NULL UNIQUE,
 DESCRIPTION VARCHAR(255) NOT NULL,
 prix DECIMAL(8,2),
 marque VARCHAR(100)
 );
 INSERT INTO product_p (REFERENCE, DESCRIPTION)
 VALUES ('REF001', 'Ballon de football');
   SELECT * FROM product_p; 
  
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
   SELECT * FROM reservations_voyage; 
  
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
 SELECT * FROM eleve; 
 
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
 SELECT * FROM reservation;  

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
  SELECT * FROM  contact;  
 
 -- UNIQUE -- 
 
 -- Exercice 1.1 --
 
 DROP TABLE if EXISTS employes;
 CREATE TABLE employes (
 id INT PRIMARY KEY,
 nom VARCHAR(100),
 prenom VARCHAR(100),
 email VARCHAR (255),
 numero_badge VARCHAR(50)
 );
 ALTER TABLE employes
 ADD CONSTRAINT unique_email UNIQUE (email);
 INSERT INTO employes (id, nom, prenom, email, numero_badge) 
VALUES (1, 'Dupont', 'Jean', 'jean.dupont@entreprise.com', 'EMP001');
-- INSERT INTO employes (id, nom, prenom, email, numero_badge) --
-- VALUES (2, 'Martin', 'Marie', 'jean.dupont@entreprise.com', 'EMP002'); -- Erreur duplicate entry (email deja existante)

-- Exercice 1.2 -- 
DROP TABLE if EXISTS evenements;
CREATE TABLE evenements ( 
id INT PRIMARY KEY,
nom_evenement VARCHAR(100),
code_evenement VARCHAR(50),
date_evenement DATE,
lieu VARCHAR(100)
);
ALTER TABLE evenements
ADD CONSTRAINT unique_code_evenement UNIQUE (code_evenement);
INSERT INTO evenements (id, nom_evenement, code_evenement, date_evenement, lieu)
VALUES 
(1, 'Concert de Jazz', 'EVT001', '2026-12-15', 'Rouen');
 -- INSERT INTO evenements (id, nom_evenement, code_evenement, date_evenement, lieu) -- 
 -- VALUES  (2, 'Festival de musique', 'EVT001', '2026-12-20', 'Paris'); Erreur Duplicate entry -- 
 -- Question de reflexion : L'id sert a identifier l'evenement dans la base de donnees, 
 -- le code evenement permet de retrouver et reconnaitre facilement un evenement lors des reservations. Le code unique evite les confusions et les erreurs --
 
 -- Exercice 1.3 -- 
 DROP TABLE IF EXISTS livres;
 CREATE TABLE livres (
 id INT PRIMARY KEY,
 titre VARCHAR(255),
 auteur VARCHAR(100),
 isbn VARCHAR(200) UNIQUE,
 prix DECIMAL(8,2),
 stock_disponible INT 
 );
 INSERT INTO livres (id, titre, auteur, isbn, prix, stock_disponible)
 VALUES (1, 'Le petit Prince', 'Antoine de Saint-Exupery', '9782070612758', 9.90, 5);
 -- INSERT INTO livres (id, titre, auteur, isbn, prix, stock_disponible)
  -- VALUES (2, 'Les miserables', 'Victor Hugo', '9782070612758', 12.90, 3); Erreur, meme code isbn --
   SELECT * FROM livres;  
  
  -- Exercice 1.4 -- 
  DROP TABLE if EXISTS seances;
  CREATE TABLE seances (
    id INT PRIMARY KEY,
    film VARCHAR(255) NOT NULL,
    salle VARCHAR(10) NOT NULL,
    heure_debut TIME NOT NULL,
    numero_billet VARCHAR(20) NOT NULL
);
ALTER TABLE seances
ADD CONSTRAINT unique_numero_billet UNIQUE (numero_billet);
INSERT INTO seances(id, film, salle, heure_debut, numero_billet)
VALUES (1, 'Inception', 'Salle 1', '14:00:00', 'CINE-2024-001'); 
-- INSERT INTO seances(id, film, salle, heure_debut, numero_billet)
-- VALUES (2, 'Interstallar', 'Salle 2', '16:00:00', 'CINE-2024-001'); Erreur meme numero billet --
 SELECT * FROM seances; 

--  EXERCICE 1.5 -- 
DROP TABLE if EXISTS utilisateur;
CREATE TABLE utilisateur (
    id INT PRIMARY KEY,
    nom_utilisateur VARCHAR(50) NOT NULL,
    nom_complet VARCHAR(100) NOT NULL,
    date_inscription DATE NOT NULL,
    bio TEXT
);
ALTER TABLE utilisateur
ADD CONSTRAINT unique_nom_utilisateur UNIQUE (nom_utilisateur);
INSERT INTO utilisateur (id, nom_utilisateur, nom_complet, date_inscription, bio)
VALUES (1, 'jeandupont76', 'Jean Dupont', '2026-11-26', 'Passion de musique');
 SELECT * FROM utilisateur; 

-- Exercice 1.6 --

DROP TABLE if EXISTS vehicules; 
CREATE TABLE vehicules (
    id INT PRIMARY KEY,
    marque VARCHAR(50) NOT NULL,
    modele VARCHAR(50) NOT NULL,
    plaque_immatriculation VARCHAR(15) NOT NULL,
    vin VARCHAR(17) NOT NULL,
    annee INT
);
ALTER TABLE vehicules
ADD CONSTRAINT unique_plaque UNIQUE (plaque_immatriculation);
INSERT INTO vehicules (id, marque, modele, plaque_immatriculation, vin, annee)
VALUES (1, 'Peugeot', '208', 'AB-123-CD', 'vf3XXXXXXXXXXXXXX', 2022);
 SELECT * FROM vehicules;  

-- Bonus : plaque immatriculation et VIN car chaque vehicule possede une plaque diffferente et un numero vin unique different attribue lors de la fabrication

-- DEFAULT -- 

-- Exercice 1.1 -- 
DROP TABLE if EXISTS commandes;
CREATE TABLE commandes (
id INT,
numero_commande VARCHAR(50),
client_id INT, 
statut VARCHAR(30),
date_creation DATETIME,
montant_total DECIMAL(10,2)
);
ALTER TABLE commandes 
ALTER statut SET DEFAULT 'EN ATTENTE',
ALTER date_creation SET DEFAULT CURRENT_TIMESTAMP;
INSERT INTO commandes (numero_commande, client_id, montant_total) 
VALUES ('CMD001', 123, 89.99);
 SELECT * FROM commandes;
 -- Les valeurs non renseignees utilisent leurs valeurs set default si elle existe

-- exercice 1.2 -- 

DROP TABLE if EXISTS comptes_bancaires;
CREATE TABLE comptes_bancaires (
id INT PRIMARY KEY,
numero_compte VARCHAR(30),
nom_titulaire VARCHAR(100),
solde DECIMAL(10,2) DEFAULT 0,
statut_compte VARCHAR(20) DEFAULT 'ACTIF',
date_ouverture DATETIME DEFAULT CURRENT_TIMESTAMP 
);
INSERT INTO comptes_bancaires (id, numero_compte, nom_titulaire)
VALUES (1, 'FR001234', 'Jean Dupont');
  SELECT * FROM comptes_bancaires; 
 -- Utiliser DEFAULT permet d'attribuer automatiquement des valeurs aux nouveaux comptes , cela evite eles oublis et reduis les erreurs
 
 -- Exercice 1.3 --
 DROP TABLE if EXISTS tickets;
 CREATE TABLE tickets  (
 id INT PRIMARY KEY,
 titre VARCHAR(255),
 DESCRIPTION TEXT,
 priorite VARCHAR(20) DEFAULT 'NORMAL',
 statut VARCHAR(20) DEFAULT 'OUVERT',
 date_creation DATETIME DEFAULT CURRENT_TIMESTAMP,
 assigne_a VARCHAR(100)
 );
 INSERT INTO tickets (id, titre, DESCRIPTION, assigne_a)
 VALUES (1, ' Probleme de connexion', 'Impossible de se connecter au compte', 'Jean');
  SELECT * FROM tickets;  

-- Exercice 1.4 -- 
DROP TABLE if EXISTS reservations; 
CREATE TABLE reservations (
    id INT PRIMARY KEY,
    nom_client VARCHAR(100) NOT NULL,
    numero_chambre VARCHAR(10) NOT NULL,
    date_arrivee DATE NOT NULL,
    date_depart DATE NOT NULL,
    nombre_adultes INT,
    statut VARCHAR(20),
    date_reservation DATETIME
);
ALTER TABLE reservations
ALTER statut SET DEFAULT 'CONFIRMEE',
ALTER nombre_adultes SET DEFAULT 1,
ALTER date_reservation SET DEFAULT CURRENT_TIMESTAMP;
INSERT INTO reservations (
id, nom_client, numero_chambre, date_arrivee, date_depart)
VALUES 
(1, 'Paul Martin', '205', '2026-12-10', '2026-12-15');
 SELECT * FROM reservations;  

-- Exercice 1.5 -- 
DROP TABLE if EXISTS produits;
CREATE TABLE produits (
    id INT PRIMARY KEY,
    nom VARCHAR(255) NOT NULL,
    reference VARCHAR(50) NOT NULL,
    prix DECIMAL(10,2) NOT NULL,
    stock_actuel INT,
    disponible BOOLEAN,
    date_ajout DATETIME
);
ALTER TABLE produits
ALTER stock_actuel SET DEFAULT 0,
ALTER disponible SET DEFAULT TRUE,
ALTER DATE_ajout SET DEFAULT CURRENT_TIMESTAMP;
INSERT INTO produits (id, nom, REFERENCE, prix )
VALUES 
(1, 'Clavier gamer', 'CLAV001', 79.99);
 SELECT * FROM produits; 

-- Exercice 1.6 -- 
DROP TABLE if EXISTS participants;
CREATE TABLE participants (
    id INT PRIMARY KEY,
    nom_complet VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    formation_id INT NOT NULL,
    statut_inscription VARCHAR(20),
    actif BOOLEAN,
    date_inscription DATETIME,
    niveau_satisfaction INT
);
ALTER TABLE participants
ALTER statut_inscription SET DEFAULT 'INSCRIT',
ALTER actif SET DEFAULT TRUE,
ALTER date_inscription SET DEFAULT CURRENT_TIMESTAMP,
ALTER niveau_satisfaction SET DEFAULT 0;
INSERT INTO participants ( id, nom_complet, email, formation_id)
VALUES 
(1, 'Lucas Bernard', 'lucas@mail.fr', 1);
  SELECT * FROM participants;  

 -- Si une entreprise decide que le statut par defaut doit passer de INSCRIT a EN ATTENTE,
  -- il faudra modifier la contrainte dans la base de donnees, DEFAUT facilite les insertions et evite de repetere certaines valeurs mais il faut choisir des valeurs coherentes avec les regles de gestion
  
  -- CHECK -- 
  
  -- Exercice 1.1 -- 
  DROP TABLE if EXISTS employes_check;
  CREATE TABLE employes_check (
  id INT PRIMARY KEY,
  nom VARCHAR(100),
  prenom VARCHAR(100),
  age INT,
  salaire DECIMAL(10,2),
  departement VARCHAR(100)
  );
  Alter TABLE employes_check
  ADD CONSTRAINT chk_age CHECK (age BETWEEN 16 AND 70),
  ADD CONSTRAINT chk_salaire CHECK (Salaire > 0);
  INSERT INTO employes_check (id, nom, prenom, age, salaire, departement) 
  VALUES (1, 'Dupont', 'Jean', 20, 2500.00, 'IT');
 --  INSERT INTO employes (id, nom, prenom, age, salaire, departement) 
-- VALUES (1, 'Dupont', 'Jean', 15, 2500.00, 'IT');
-- INSERT INTO employes (id, nom, prenom, age, salaire, departement) 
 -- VALUES (2, 'Martin', 'Sophie', 35, -1000.00, 'RH');
 -- Erreur car l'age est 15 ans, et le salaire -1000.00 

  SELECT * FROM employes_check;

-- Exercice 1.2 -- 

DROP TABLE if EXISTS produits_check;
CREATE TABLE produits_check (
id INT primary KEY,
nom VARCHAR(100),
prix DECIMAL(10,2),
stock INT,
note_moyenne DECIMAL(3,2)
);
ALTER TABLE produits_check
ADD CONSTRAINT chk_prix CHECK (prix > 0),
ADD CONSTRAINT chk_stock CHECK (stock >= 0),
ADD CONSTRAINT chk_note CHECK (note_moyenne BETWEEN 1 AND 5);
INSERT INTO produits_check (id, nom, prix, stock, note_moyenne)
VALUES
(1, 'Clavier gamer', 79.99, 10, 4.5);
  SELECT * FROM produits_check;  
 -- Bonus : Pour eviter les erreurs, cela permet de garder des donnes coherentes et d'empecher l'enregistrement de valeurs incorrectes
 
 -- Exercice 1.3 -- 
 DROP TABLE if EXISTS reservations_salles;
 CREATE TABLE reservations_salles (
 id INT PRIMARY KEY,
 nom_salle VARCHAR(100),
 heure_debut INT,
 heure_fin INT,
 capacite_max INT 
 );
 ALTER TABLE reservations_salles
 ADD CONSTRAINT chk_heure_debut CHECK (heure_debut BETWEEN 8 AND 22),
 ADD CONSTRAINT chk_heure_fin CHECK (heure_fin BETWEEN 8 AND 22),
 ADD CONSTRAINT chk_capacite CHECK (capacite_max <= 500);
 INSERT INTO reservations_salles (id, nom_salle, heure_debut, heure_fin, capacite_max)
 VALUES 
 (1, 'Salle A', 9, 18, 100);
   SELECT * FROM reservations_salles; 
  
  -- Exercice 1.4 -- 
 DROP  TABLE if EXISTS notes; 
  CREATE TABLE notes (
    id INT PRIMARY KEY,
    etudiant_id INT NOT NULL,
    matiere VARCHAR(50) NOT NULL,
    note DECIMAL(4,2),
    coefficient INT,
    date_evaluation DATE NOT NULL
);
ALTER TABLE notes
ADD CONSTRAINT chk_note_valeur CHECK (note BETWEEN 0 AND 20),
ADD CONSTRAINT chk_coefficient CHECK (coefficient BETWEEN 1 AND 50);
INSERT INTO notes (id, etudiant_id, matiere, note, coefficient, date_evaluation)
VALUES (1, 10, 'Mathematiques', 15, 3, '2026-11-27');
  SELECT * FROM notes; 
 
 -- Exercice 1.5 -- 
 DROP TABLE if EXISTS comptes_clients;
 CREATE TABLE comptes_clients (
    id INT PRIMARY KEY,
    numero_compte VARCHAR(20) NOT NULL,
    nom_titulaire VARCHAR(100) NOT NULL,
    solde DECIMAL(12,2),
    taux_interet DECIMAL(5,2),
    date_ouverture DATE NOT NULL
);
ALTER TABLE comptes_clients
ADD CONSTRAINT chk_solde CHECK (solde >= -5000),
ADD CONSTRAINT chk_taux_interet CHECK (taux_interet BETWEEN 0 AND 15);
INSERT INTO comptes_clients ( id, numero_compte, nom_titulaire, solde, taux_interet, DATE_ouverture)
VALUES 
(1, 'FR001', 'Dupont Jean', 1500, 2.5, '2026-11-27');
  SELECT * FROM comptes_clients;  
 
 -- Exercice 1.6 -- 
 
 DROP TABLE if EXISTS donnees_medicales;
 CREATE TABLE donnees_medicales (
    id INT PRIMARY KEY,
    patient_id INT NOT NULL,
    tension_systolique INT,
    tension_diastolique INT,
    frequence_cardiaque INT,
    poids DECIMAL(5,2),
    date_mesure DATE NOT NULL
);
ALTER TABLE donnees_medicales
ADD CONSTRAINT chk_tension_sys CHECK (tension_systolique BETWEEN 80 AND 250),
ADD CONSTRAINT chk_tension_dia CHECK ( tension_diastolique  BETWEEN 50 AND 150),
ADD CONSTRAINT chk_frequence CHECK ( frequence_cardiaque BETWEEN 40 AND 200);
INSERT INTO donnees_medicales (id, patient_id, tension_systolique, tension_diastolique, frequence_cardiaque, poids, date_mesure)
VALUES 
(1, 10, 120, 80, 70, 75.50, '2026-11-27');
  SELECT * FROM  donnees_medicales;  
 
 -- Bonus : Les contraintes CHECK permettent de limiter les valeurs incoherentes dans la base de donjnes, 
 -- les donnes medicales errones peuvent induire en erreur les professionnels de sante et entrainer de mauvaises decisions

-- FOREIGN KEY --

-- Exercice 1.1 -- 
DROP TABLE if EXISTS auteurs;
CREATE TABLE auteurs (
id INT PRIMARY KEY,
nom VARCHAR(100),
prenom VARCHAR(100),
nationalite VARCHAR(100)
);
DROP TABLE if EXISTS livre;
CREATE TABLE livre (
id INT PRIMARY KEY,
titre VARCHAR (100),
isbn VARCHAR(20),
auteur_id INT,
annee_publication INT 
);
ALTER TABLE livre
ADD CONSTRAINT fk_livre_auteurs
FOREIGN KEY (auteur_id)
REFERENCES auteurs(id);
INSERT INTO auteurs (id, nom, prenom, nationalite)
VALUES (1, 'Hugo', 'Victor', 'Francaise');
INSERT INTO livre (id, titre, isbn, auteur_id, annee_publication)
VALUES (1, 'Les Miserables', '978-123456789', 1, 1862);
-- INSERT INTO livre (id, titre, isbn, auteur_id, annee_publication) 
 -- VALUES (1, 'Le Mystère', '978-123456789', 999, 2023);
 
-- Bonus : Erreur car l'auteur 999 n'existe pas 

  SELECT  livre.titre, auteurs.nom, auteurs.prenom
  FROM livre
 INNER JOIN auteurs ON livre.auteur_id = auteurs.id; 

-- Exercice 1.2 -- 
DROP TABLE if EXISTS categories;
CREATE TABLE categories (
    id INT PRIMARY KEY,
    nom VARCHAR(100),
    description VARCHAR(255)
);
DROP TABLE if EXISTS cours; 
CREATE TABLE cours (
    id INT PRIMARY KEY,
    titre VARCHAR(100),
    duree INT,
    prix DECIMAL(10,2),
    categorie_id INT
);
ALTER TABLE cours
ADD CONSTRAINT fk_cours_categories
FOREIGN KEY (categorie_id)
REFERENCES categories(id);
INSERT INTO categories (id, nom, description)
VALUES (1, 'Développement web', 'Formation aux technologies web');
INSERT INTO cours (id, titre, duree, prix, categorie_id)
VALUES (1, 'Apprendre HTML et CSS', 20, 149.90, 1);
 SELECT cours.titre, categories.nom
 FROM cours
 INNER JOIN categories ON cours.categorie_id = categories.id;

-- Avec FOREIGN KEY on evite de repeter le nom de la categorie dans chaque cours, elle permet aussi de verifier qu'un cours est associe a une categorie qui existe vraiment

-- Exercice 1.3 -- 

DROP TABLE if EXISTS projets;
CREATE TABLE projets (
    id INT PRIMARY KEY,
    nom VARCHAR(100),
    budget DECIMAL(10,2)
);
DROP TABLE if EXISTS taches;
CREATE TABLE taches (
    id INT PRIMARY KEY,
    nom VARCHAR(100),
    description VARCHAR(255),
    projet_id INT,
    employe_id INT,
    statut VARCHAR(50)
);
DROP TABLE if EXISTS employes_fk;
CREATE TABLE employes_fk (
    id INT PRIMARY KEY,
    nom VARCHAR(100),
    email VARCHAR(100)
);
ALTER TABLE taches
ADD CONSTRAINT fk_taches_projets
FOREIGN KEY (projet_id)
REFERENCES projets(id);

ALTER TABLE taches
ADD CONSTRAINT fk_tache_employes
FOREIGN KEY (employe_id)
REFERENCES employes_fk(id);
INSERT INTO projets (id, nom, budget)
VALUES (1, 'Refonte du site web', 5000.00);
INSERT INTO employes_fk (id, nom, email)
VALUES (1, 'Thomas Martin', 'thomas.martin@example.com');
INSERT INTO taches (id, nom, description, projet_id, employe_id, statut)
VALUES (1, 'Créer la page d’accueil', 'Intégration HTML et CSS', 1, 1, 'En cours');
 SELECT taches.nom, projets.nom, employes_fk.nom
 FROM taches
 INNER JOIN projets ON taches.projet_id = projets.id
 INNER JOIN employes_fk ON taches.employe_id = employes_fk.id;

-- Exercice 1.4 -- 
DROP TABLES if EXISTS clients;
CREATE TABLE clients (
    id INT PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    telephone VARCHAR(20)
);
DROP TABLE if EXISTS factures;
CREATE TABLE factures (
    id INT PRIMARY KEY,
    numero_facture VARCHAR(20) NOT NULL,
    client_id INT NOT NULL,
    montant DECIMAL(10,2) NOT NULL,
    date_emission DATE NOT NULL,
    statut VARCHAR(20) DEFAULT 'EN_ATTENTE'
);
ALTER TABLE factures
ADD CONSTRAINT fk_factures_clients
FOREIGN KEY (client_id)
REFERENCES clients(id);
INSERT INTO clients (id, nom, email, telephone)
VALUES (1, 'Thomas Martin', 'thomas.martin@example.com', '0612345678');
INSERT INTO factures (id, numero_facture, client_id, montant, date_emission, statut)
VALUES (1, 'FAC-2026-001', 1, 299.90, '2026-11-27', 'PAYEE');
 SELECT factures.numero_facture, clients.nom, factures.montant
 FROM factures
 INNER JOIN clients ON factures.client_id = clients.id;

-- Exercice 1.5 -- 
DROP TABLE if EXISTS medecins;
CREATE TABLE medecins (
    id INT PRIMARY KEY,
    nom VARCHAR(80) NOT NULL,
    specialite VARCHAR(50) NOT NULL,
    numero_ordre VARCHAR(20) NOT NULL UNIQUE
);
DROP TABLE if EXISTS patients;
CREATE TABLE patients (
    id INT PRIMARY KEY,
    nom VARCHAR(80) NOT NULL,
    prenom VARCHAR(80) NOT NULL,
    numero_securite_sociale VARCHAR(15) NOT NULL UNIQUE,
    date_naissance DATE NOT NULL
);
DROP TABLE if EXISTS consultations;
CREATE TABLE consultations (
    id INT PRIMARY KEY,
    medecin_id INT NOT NULL,
    patient_id INT NOT NULL,
    date_consultation DATETIME NOT NULL,
    motif TEXT,
    diagnostic TEXT
);
ALTER TABLE consultations
ADD CONSTRAINT fk_consultations_medecins
FOREIGN KEY (medecin_id)
REFERENCES medecins(id);

ALTER TABLE consultations
ADD CONSTRAINT fk_consultations_patients
FOREIGN KEY (patient_id)
REFERENCES patients(id);

INSERT INTO medecins (id, nom, specialite, numero_ordre)
VALUES (1, 'Martin', 'Cardiologie', 'ORDRE-001');
INSERT INTO patients (id, nom, prenom, numero_securite_sociale, date_naissance)
VALUES (1, 'Durand', 'Lucas', '123456789012345', '1995-06-15');
INSERT INTO consultations (id, medecin_id, patient_id, date_consultation, motif, diagnostic)
VALUES (1, 1, 1, '2026-11-27 10:30:00', 'Douleurs thoraciques', 'Examen de contrôle');
 SELECT consultations.id, medecins.nom, patients.nom, patients.prenom, consultations.motif, consultations.diagnostic
 FROM consultations
 INNER JOIN medecins ON consultations.medecin_id = medecins.id
 INNER JOIN patients ON consultations.patient_id = patients.id;

-- Exercice 1.6 -- 

DROP TABLE if EXISTS clients_voyage;
CREATE TABLE clients_voyage (
    id INT PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    passeport VARCHAR(20) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL
);
DROP TABLE if EXISTS vols;
CREATE TABLE vols (
    id INT PRIMARY KEY,
    numero_vol VARCHAR(10) NOT NULL UNIQUE,
    destination VARCHAR(100) NOT NULL,
    date_depart DATETIME NOT NULL,
    prix DECIMAL(8,2) NOT NULL
);
DROP TABLE if EXISTS reservations_voyages;
CREATE TABLE reservations_voyages (
    id INT PRIMARY KEY,
    client_id INT NOT NULL,
    vol_id INT NOT NULL,
    date_reservation DATETIME DEFAULT NOW(),
    statut VARCHAR(20) DEFAULT 'CONFIRMEE',
    siege VARCHAR(5)
);
ALTER TABLE reservations_voyages
ADD CONSTRAINT fk_reservations_clients
FOREIGN KEY (client_id)
REFERENCES clients_voyage(id);
ALTER TABLE reservations_voyages
ADD CONSTRAINT fk_reservations_vols
FOREIGN KEY (vol_id)
REFERENCES vols(id);
INSERT INTO clients_voyage (id, nom, passeport, email)
VALUES (1, 'Lucas Durand', 'FR123456', 'lucas.durand@example.com');
INSERT INTO vols (id, numero_vol, destination, date_depart, prix)
VALUES(1, 'AF123', 'New York', '2026-12-15 14:30:00', 450.00);
INSERT INTO reservations_voyages (id, client_id, vol_id, siege)
VALUES (1, 1, 1, '12A');
 SELECT clients_voyage.nom, vols.numero_vol, vols.destination, reservations_voyages.siege
 FROM reservations_voyages
 INNER JOIN clients_voyage ON reservations_voyages.client_id = clients_voyage.id
 INNER JOIN vols ON reservations_voyages.vol_id = vols.id;

-- Bonus : Avec une FOREIGN KEY on ne peut pas suupprimer un vol tant qu'une reservation y est associer pour eviter de conserver une reservation vers un vol inexistant
-- Si on utilise ON DELETE SET NULL le vol est supprime tandis que les reservations sont conserves a condition que vol_id soit null
-- CASCADE supprimerait automatiquement les reservations liees au vol et RESTRICT empecherait les suppressions des vols s'ils possedent des reservations

-- AJOUTER_SUPPRIMER_COLONNES -- 

-- Exercice 1.1 -- 

DROP TABLE if EXISTS eleves;
CREATE TABLE eleves (
id INT PRIMARY KEY,
prenom VARCHAR(50)
);
ALTER TABLE eleves
ADD COLUMN nom VARCHAR(50);
INSERT INTO eleves (id, prenom, nom)
VALUES 
(1, 'Lucas', 'Martin'),
(2, 'Emma', 'Durand');
  SELECT * FROM eleves;  
 
 -- Exercice 1.2 -- 
 
 DROP TABLE if EXISTS produits_alter;
 CREATE TABLE produits_alter ( 
 id INT PRIMARY KEY,
 nom VARCHAR(100),
 prix DECIMAL (5,2)
 );
 ALTER TABLE produits_alter
 DROP COLUMN prix;
 -- INSERT INTO produits (prix)
 -- VALUES (20.90); 
 
 -- Exercice 1.3 -- 
 DROP TABLE if EXISTS clients_alter; 
 CREATE TABLE clients_alter(
 id INT PRIMARY KEY,
 email VARCHAR(100)
 );
 ALTER TABLE clients_alter
 ADD COLUMN nom VARCHAR(50),
 ADD COLUMN telephone VARCHAR(20);
 INSERT INTO clients_alter (id, email, nom, telephone)
 VALUES (1, 'lucas@gmail.com', 'Lucas Martin', '0611125616');
   SELECT * FROM clients_alter;  

  -- Exercice 1.4 -- 
  DROP TABLE if EXISTS commandes_alter;
  CREATE TABLE commandes_alter ( 
  id INT PRIMARY KEY,
  total VARCHAR(20)
  );
  ALTER TABLE commandes_alter
  MODIFY COLUMN total DECIMAL(8,2),
  ADD COLUMN date_commande DATE;
  INSERT INTO commandes_alter (id, total, date_commande)
  VALUES (1, 149.90, '2026-11-27');
   SELECT * FROM commandes_alter;  
  
  -- Exercices 1.5 -- 
  DROP TABLE if EXISTS test;
  CREATE TABLE test (
  id INT PRIMARY KEY 
  );
  ALTER TABLE test
  ADD COLUMN temp VARCHAR(10);
  ALTER TABLE test
  DROP COLUMN temp;
   DESCRIBE test; 
  
 -- Exercice 1.6 -- 
 DROP TABLE if EXISTS  essais;
 START TRANSACTION;
 CREATE TABLE essais ( 
 id INT PRIMARY KEY 
 );
 ALTER TABLE essais
 ADD COLUMN essais_col INT;
 ROLLBACK;
  -- DESCRIBE essais; -- Non reussi
 
 -- jeu test -- 
DROP TABLE IF EXISTS emprunts_jeu;
DROP TABLE IF EXISTS livres_jeu;
DROP TABLE IF EXISTS membres_jeu;

CREATE TABLE membres_jeu (
  id INT PRIMARY KEY AUTO_INCREMENT,
  numero_carte VARCHAR(10) UNIQUE NOT NULL,
  nom VARCHAR(50) NOT NULL,
  prenom VARCHAR(50) NOT NULL,
  email VARCHAR(100) UNIQUE NOT NULL,
  date_inscription DATE NOT NULL DEFAULT (CURRENT_DATE),
  statut ENUM('actif','suspendu','expire') DEFAULT 'actif',
  telephone VARCHAR(15),
  CONSTRAINT chk_email_format CHECK (
    email REGEXP '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$'
  )
);

CREATE TABLE livres_jeu (
  id INT PRIMARY KEY AUTO_INCREMENT,
  isbn VARCHAR(13) UNIQUE NOT NULL,
  titre VARCHAR(200) NOT NULL,
  auteur VARCHAR(100) NOT NULL,
  annee_publication SMALLINT NOT NULL,                      -- corrigé (1) : YEAR -> SMALLINT
  genre VARCHAR(50),
  nombre_exemplaires INT NOT NULL DEFAULT 1,
  exemplaires_disponibles INT NOT NULL DEFAULT 1,
  prix_achat DECIMAL(8,2) NOT NULL,
  CONSTRAINT chk_isbn_format CHECK (LENGTH(isbn) IN (10,13)),
  CONSTRAINT chk_annee_valide CHECK (
    annee_publication BETWEEN 1000 AND 2100                 -- corrigé (2) : plus de CURDATE()
  ),
  CONSTRAINT chk_exemplaires_positifs CHECK (nombre_exemplaires > 0),
  CONSTRAINT chk_disponibles_coherents CHECK (
    exemplaires_disponibles >= 0
    AND exemplaires_disponibles <= nombre_exemplaires
  ),
  CONSTRAINT chk_prix_positif CHECK (prix_achat > 0)
);

CREATE TABLE emprunts_jeu (
  id INT PRIMARY KEY AUTO_INCREMENT,
  membre_id INT NOT NULL,
  livre_id INT NOT NULL,
  date_emprunt DATE NOT NULL DEFAULT (CURRENT_DATE),
  date_retour_prevue DATE NOT NULL,
  date_retour_effective DATE NULL,
  statut ENUM('en_cours','rendu','en_retard','perdu') DEFAULT 'en_cours',
  FOREIGN KEY (membre_id) REFERENCES membres_jeu(id) ON DELETE CASCADE,
  FOREIGN KEY (livre_id)  REFERENCES livres_jeu(id)   ON DELETE RESTRICT,
  CONSTRAINT chk_dates_coherentes CHECK (
    date_retour_prevue > date_emprunt
  ),
  CONSTRAINT chk_retour_effectif CHECK (
    date_retour_effective IS NULL
    OR date_retour_effective >= date_emprunt
  )
);

-- Membres valides
INSERT INTO membres_jeu (numero_carte, nom, prenom, email, telephone) VALUES
  ('CARTE001', 'Martin', 'Lucas', 'lucas.martin@mail.fr', '0611125616'),
  ('CARTE002', 'Durand', 'Emma', 'emma.durand@mail.fr', '0612111656'),
  ('CARTE003', 'Petit', 'Hugo', 'hugo.petit@mail.fr', '0629447779'),
  ('CARTE004', 'Robert', 'Lea', 'lea.robert@mail.fr', '0644777929'),
  ('CARTE005', 'Moreau', 'Nathan', 'nathan.moreau@mail.fr', '0777845205');

-- Livres valides (corrigé (3) : exemplaires_disponibles cohérents avec les emprunts)
INSERT INTO livres_jeu (isbn, titre, auteur, annee_publication, genre, nombre_exemplaires, exemplaires_disponibles, prix_achat)
VALUES
  ('9782070360024', 'L etranger', 'Albert Camus', 1942, 'Roman', 5, 5, 8.50),
  ('9782070360025', 'Le petit Prince', 'Antoine de Saint-Exupery', 1943, 'Conte', 8, 7, 12.90),
  ('9782070360026', 'Les Miserables', 'Victor Hugo', 1862, 'Roman', 10, 9, 15.00),
  ('9782070360027', 'Harry Potter', 'J.K. Rowling', 1997, 'Fantastique', 6, 6, 20.00),
  ('9782070360028', 'Le Cid', 'Pierre Corneille', 1637, 'Theatre', 4, 3, 9.90);

-- Emprunts valides (corrigé (4) : dates de retour effectif / (5) : statuts en_retard)
INSERT INTO emprunts_jeu (membre_id, livre_id, date_emprunt, date_retour_prevue, date_retour_effective, statut)
VALUES
  (1, 1, '2026-11-01', '2026-11-15', '2026-11-14', 'rendu'),
  (2, 2, '2026-11-10', '2026-11-24', NULL, 'en_retard'),
  (3, 3, '2026-11-12', '2026-11-26', NULL, 'en_retard'),
  (4, 4, '2026-11-05', '2026-11-19', '2026-11-18', 'rendu'),
  (5, 5, '2026-11-15', '2026-11-29', NULL, 'en_cours');
  /*
  -- N-01 Violation UNIQUE numero_carte
  INSERT INTO membres_jeu (numero_carte, nom, prenom, email, telephone) 
  VALUES ('CARTE001', 'Dupont', 'Paul', 'paul.dupont@mail.fr', '0612131415');  -- échec attendu

-- N-02 Email invalide
  INSERT INTO membres_jeu (numero_carte, nom, prenom, email, telephone)
 VALUES ('CARTE006', 'Dupont', 'Paul', 'email-invalide.fr', '0612131415');  -- échec attendu

-- N-03 ISBN hors format
  INSERT INTO livres_jeu (isbn, titre, auteur, annee_publication, genre, nombre_exemplaires, exemplaires_disponibles, prix_achat) 
   VALUES ('12345678', 'Livre test', 'Auteur test', 2020, 'Roman', 2, 2, 10.00);  -- échec attendu

-- N-04 Prix négatif
  INSERT INTO livres_jeu (isbn, titre, auteur, annee_publication, genre, nombre_exemplaires, exemplaires_disponibles, prix_achat)
  VALUES ('9782070360029', 'Livre test', 'Auteur test', 2020, 'Roman', 2, 2, -10.00);  -- échec attendu

-- N-05 FK emprunt vers membre inexistant
   INSERT INTO emprunts_jeu (membre_id, livre_id, date_emprunt, date_retour_prevue, date_retour_effective, statut)
  VALUES (9999, 1, '2026-11-20', '2026-12-04', NULL, 'en_cours');  -- échec attendu

-- N-06 date_retour_prevue antérieure à date_emprunt
 INSERT INTO emprunts_jeu (membre_id, livre_id, date_emprunt, date_retour_prevue, date_retour_effective, statut) 
  VALUES (1, 1, '2026-11-20', '2026-11-15', NULL, 'en_cours');  -- échec attendu
*/
 -- L-01 Email longueur maximale
INSERT INTO membres_jeu (numero_carte, nom, prenom, email, telephone)
 VALUES ('CARTE006', 'Bernard', 'Paul', CONCAT(repeat('a', 92), '@test.fr'), '0612345678');  -- PASS attendu

-- L-02 ISBN longueur 10
INSERT INTO livres_jeu (isbn, titre, auteur, annee_publication, genre, nombre_exemplaires, exemplaires_disponibles, prix_achat)
 VALUES ('1234567890', 'Livre limite', 'Auteur test', 2020, 'Roman', 2, 2, 10.00);  -- PASS attendu

-- L-03 exemplaires_disponibles = 0
INSERT INTO livres_jeu (isbn, titre, auteur, annee_publication, genre, nombre_exemplaires, exemplaires_disponibles, prix_achat)
 VALUES ('9782070360030', 'Livre indisponible', 'Auteur test', 2020, 'Roman', 2, 0, 10.00);  -- PASS attendu

-- L-04 prix maximal DECIMAL(8,2)
INSERT INTO livres_jeu (isbn, titre, auteur, annee_publication, genre, nombre_exemplaires, exemplaires_disponibles, prix_achat)
 VALUES ('9782070360031', 'Livre prix maximum', 'Auteur test', 2020, 'Roman', 1, 1, 999999.99);  -- PASS attendu

-- L-05 année_publication = 1000
INSERT INTO livres_jeu (isbn, titre, auteur, annee_publication, genre, nombre_exemplaires, exemplaires_disponibles, prix_achat)
 VALUES ('9782070360032', 'Livre ancien', 'Auteur test', 1000, 'Histoire', 1, 1, 10.00);  -- PASS attendu

-- L-06 statut emprunt = 'perdu'
INSERT INTO emprunts_jeu (membre_id, livre_id, date_emprunt, date_retour_prevue, date_retour_effective, statut)
 VALUES (1, 1, '2026-11-20', '2026-12-04', NULL, 'perdu');  -- PASS attendu

-- Test unicité numero_carte

SELECT 'Unicité carte' AS test,
       CASE WHEN COUNT(*) = COUNT(DISTINCT numero_carte)
            THEN 'PASS' ELSE 'FAIL' END AS resultat
FROM membres_jeu;

-- Test format email
SELECT 'Format email' AS test,
       CASE WHEN COUNT(*) = 0 THEN 'PASS' ELSE 'FAIL' END AS resultat
FROM membres_jeu
WHERE email NOT REGEXP '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$';

-- Test FK emprunts→membres
SELECT 'FK emprunts→membres' AS test,
       CASE WHEN COUNT(*) = 0 THEN 'PASS' ELSE 'FAIL' END AS resultat
FROM emprunts_jeu e
LEFT JOIN membres_jeu m ON e.membre_id = m.id
WHERE m.id IS NULL;

-- Test CHECK exemplaires
SELECT 'Disponibles≤Total' AS test,
       CASE WHEN COUNT(*) = 0 THEN 'PASS' ELSE 'FAIL' END AS resultat
FROM livres_jeu
WHERE exemplaires_disponibles > nombre_exemplaires;

-- Test date_retour_prevue
SELECT 'Dates cohérentes' AS test,
       CASE WHEN COUNT(*) = 0 THEN 'PASS' ELSE 'FAIL' END AS resultat
FROM emprunts_jeu
WHERE date_retour_prevue <= date_emprunt;
CREATE INDEX idx_recherche_livres
ON livres_jeu (auteur, titre);
-- Ajouter une contrainte ou un mecanisme de controle pour verifier que le nombre d'exemplaires disponibles correspond aux emprunts en cours pour mieux gerer le stock de livres et eviter les incoherences