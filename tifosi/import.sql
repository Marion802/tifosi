-- Créer la base de données
CREATE DATABASE IF NOT EXISTS tifosi;
USE tifosi;

-- TABLE client
CREATE TABLE client (
    id_client INT PRIMARY KEY,
    nom_client VARCHAR(45),
    age INT,
    cp_client INT
);

-- TABLE focaccia
CREATE TABLE focaccia (
    id_focaccia INT PRIMARY KEY,
    nom_focaccia VARCHAR(45),
    prix_focaccia FLOAT
);

-- TABLE ingredient
CREATE TABLE ingredient (
    id_ingredient INT PRIMARY KEY,
    nom_ingredient VARCHAR(45)
);

-- TABLE comprend (relation focaccia - ingredient)
CREATE TABLE comprend (
    id_focaccia INT,
    id_ingredient INT,
    PRIMARY KEY (id_focaccia, id_ingredient),
    FOREIGN KEY (id_focaccia) REFERENCES focaccia(id_focaccia),
    FOREIGN KEY (id_ingredient) REFERENCES ingredient(id_ingredient)
);

-- TABLE marque
CREATE TABLE marque (
    id_marque INT PRIMARY KEY,
    nom_marque VARCHAR(45)
);

-- TABLE achete (relation client - date - focaccia)
CREATE TABLE achete (
    id_client INT,
    id_focaccia INT,
    jour DATE,
    PRIMARY KEY (id_client, id_focaccia, jour),
    FOREIGN KEY (id_client) REFERENCES client(id_client),
    FOREIGN KEY (id_focaccia) REFERENCES focaccia(id_focaccia)
);

-- TABBLE menu
CREATE TABLE menu (
    id_menu INT PRIMARY KEY,
    nom_menu VARCHAR(45),
    prix_menu FLOAT
);

-- TABLE est_constitue (menu-focaccia)
CREATE TABLE est_constitue (
    id_menu INT PRIMARY KEY,
    id_focaccia INT,
    FOREIGN KEY (id_menu) REFERENCES menu(id_menu),
    FOREIGN KEY (id_focaccia) REFERENCES focaccia(id_focaccia)
);

-- TABLE boisson
CREATE TABLE boisson (
    id_boisson INT PRIMARY KEY,
    nom_boisson VARCHAR(45)
);

-- TABLE appartient (relation boisson - marque)
CREATE TABLE appartient (
    id_boisson INT PRIMARY KEY,
    id_marque INT,
    FOREIGN KEY (id_boisson) REFERENCES boisson(id_boisson),
    FOREIGN KEY (id_marque) REFERENCES marque(id_marque)
);

-- TABLE contient (relation menu - boisson)
CREATE TABLE contient (
    id_menu INT,
    id_boisson INT,
    PRIMARY KEY (id_menu, id_boisson),
    FOREIGN KEY (id_menu) REFERENCES menu(id_menu),
    FOREIGN KEY (id_boisson) REFERENCES boisson(id_boisson)
);

-- TABLE paye (relation client - menu - date)
CREATE TABLE paye (
    id_client INT,
    id_menu INT,
    jour DATE,
    PRIMARY KEY (id_client, id_menu, jour),
    FOREIGN KEY (id_client) REFERENCES client(id_client),
    FOREIGN KEY (id_menu) REFERENCES menu(id_menu)
);
