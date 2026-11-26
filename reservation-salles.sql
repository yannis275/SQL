-- Requête 1
DROP DATABASE IF EXISTS bdd_communal_rooms_booking_exemple_test;

CREATE DATABASE bdd_communal_rooms_booking_exemple_test CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

USE bdd_communal_rooms_booking_exemple_test;
-- Requête 2
DROP TABLE IF EXISTS buildings;

CREATE TABLE buildings (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    address VARCHAR(255) NOT NULL,
    floor_count INT NOT NULL,
    accessible_pmr BOOLEAN NOT NULL DEFAULT FALSE,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    uptaded_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Requête 3
DROP TABLE IF EXISTS rooms;

CREATE TABLE rooms (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL UNIQUE,
    capacity INT NOT NULL,
    equipment TEXT NOT NULL,
    last_maintenance_date DATE NOT NULL,
    building_id INT NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (building_id) REFERENCES buildings (id)
);

-- Requête 4
DROP TABLE IF EXISTS users;

CREATE TABLE users (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(255) NOT NULL UNIQUE,
    full_name VARCHAR(255) NOT NULL,
    `type` VARCHAR(50) NOT NULL,
    registration_date DATETIME NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Requête 5
DROP TABLE IF EXISTS reservations;

CREATE TABLE reservations (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    room_id INT NOT NULL,
    user_id INT NOT NULL,
    start_datetime DATETIME NOT NULL,
    duration_minutes INT NOT NULL,
    status VARCHAR(50) NOT NULL,
    reason TEXT NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (room_id) REFERENCES rooms (id),
    FOREIGN KEY (user_id) REFERENCES users (id)
);

-- Permet d'afficher les tables de la base de données courantes
SHOW TABLES;

-- Requête 6
INSERT INTO
    buildings (
        address,
        floor_count,
        accessible_pmr
    )
VALUES ('Mairie de Rouen', 5, TRUE),
    ('Centre culturel', 2, TRUE),
    (
        'Musée des beaux arts',
        2,
        TRUE
    ),
    ('Kindarena', 1, TRUE);

-- Requête 8
INSERT INTO
    rooms (
        NAME,
        capacity,
        equipment,
        last_maintenance_date,
        building_id
    )
VALUES (
        'Salle des fêtes',
        120,
        'Sonorisation, tables et chaises',
        '2026-10-15',
        1
    ),
    (
        'Salle polyvalente',
        50,
        'Tables et chaises',
        '2026-09-20',
        2
    ),
    (
        'Salle 1645A',
        15,
        'Tables et vidéoprojecteur',
        '2026-08-10',
        3
    ),
    (
        'Salle 1645B',
        15,
        'Tables et vidéoprojecteur',
        '2026-08-12',
        3
    ),
    (
        'Salle 1645C',
        15,
        'Tables et vidéoprojecteur',
        '2026-08-14',
        3
    ),
    (
        'Salle principale',
        800,
        'Scène, sonorisations et gradins',
        '2026-10-01',
        4
    );

-- Requête 9
INSERT INTO
    users (
        email,
        full_name,
        TYPE,
        registration_date
    )
VALUES (
        'admin@rouen.fr',
        'Administratur Rouen',
        'admin',
        '2026-01-10 09:00:00'
    ),
    (
        'alice.martin@example.fr',
        'Alice Martin',
        'user',
        '2026-02-15 10:30:00'
    ),
    (
        'thomas.durand@example.fr',
        'Thomas Durand',
        'user',
        '2026-03-12 14:00:00'
    ),
    (
        'sarah.petit@example.fr',
        'Sarah Petit',
        'user',
        '2026-04-05 11:15:00'
    ),
    (
        'lucas.bernard@example.fr',
        'Lucas Bernard',
        'user',
        '2026-05-20 08:45:00'
    ),
    (
        'emma.robert@example.fr',
        'Emma Robert',
        'user',
        '2026-06-18 16:20:00'
    ),
    (
        'hugo.moreau@example.fr',
        'Hugo Moreau',
        'user',
        '2026-05-20 08:45:00'
    ),
    (
        'lea.simon@example.fr',
        'Léa Simon',
        'user',
        '2026-08-30 09:30:00'
    );
-- Requete 10 --
INSERT INTO
    reservations (
        room_id,
        user_id,
        start_datetime,
        duration_minutes,
        STATUS,
        reason
    )
VALUES (
        1,
        2,
        '2026-11-20 14:00:00',
        120,
        'confirmé',
        'Réunion associative'
    ),
    (
        2,
        2,
        '2026-11-21 09:00:00',
        60,
        'en attente',
        'Atelier culturel'
    ),
    (
        3,
        3,
        '2026-11-22 10:00:00',
        90,
        'confirmé',
        'Réunion de travail'
    ),
    (
        4,
        4,
        '2026-11-23 14:00:00',
        120,
        'confirmé',
        'Formation'
    ),
    (
        5,
        5,
        '2026-11-24 09:00:00',
        60,
        'en attente',
        'Atelier'
    ),
    (
        6,
        6,
        '2026-11-24 15:00:00',
        180,
        'confirmé',
        'Evenement sportif'
    ),
    (
        1,
        7,
        '2026-11-25 10:00:00',
        90,
        'confirmé',
        'Réunion publique'
    ),
    (
        1,
        8,
        '2026-11-25 14:00:00',
        120,
        'confirmé',
        'Assemblée associative'
    );
    -- Requete 11 Lister les salles --
    SELECT *
    FROM rooms 
    WHERE capacity > 50;
    
    -- Requete 12 Afficher les reservations -- 
    SELECT *
    FROM reservations
    WHERE start_datetime >= NOW() - INTERVAL 7 DAY;
    
    -- Requete 13 Afficher le nombre de reservations par salle -- 
    SELECT rooms.name, COUNT(reservations.id) AS nombre_reservations
    FROM rooms 
    LEFT JOIN reservations ON rooms.id = reservations.room_id
    GROUP BY rooms.id, rooms.name;
    
    -- Requete 14 Capacite moyenne des salles -- 
    SELECT buildings.address, AVG(rooms.capacity) AS capacite_moyenne
    FROM buildings
    INNER JOIN rooms ON buildings.id = rooms.building_id
    GROUP BY buildings.id, buildings.address;
    
    -- Requete 15 Trouver la salle la + reservee -- 
    SELECT rooms.name, COUNT(reservations.id) AS nombre_reservations
    FROM rooms
    INNER JOIN reservations ON rooms.id = reservations.room_id
    GROUP BY rooms.id, rooms.name
    ORDER BY nombre_reservations DESC 
    LIMIT 1;
    
    -- Requete 16 Trouver la saalle jamais reservee -- 
    SELECT rooms.name
    FROM rooms
    LEFT JOIN reservations on rooms.id = reservations.room_id
    WHERE reservations.id IS NULL;
    
    -- Critere de validation --
	 -- DELETE FROM buildings  WHERE id = 1; -- 
    -- Erreur SQL (1451) -- 
    
	 -- INSERT INTO reservations (room_id, user_id, start_datetime, duration_minutes, STATUS,reason ) --
    -- VALUES (999, 2, '2026-11-26 14:00:00', 60, 'confirme', 'Test de validation' ); -- 
   -- Erreur SQL (1452) Cle etrangere inexistante --
   
