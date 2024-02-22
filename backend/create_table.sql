-- Création de la base de données 'web' s'il n'existe pas
CREATE DATABASE IF NOT EXISTS web;
USE web;

-- Création de la table 'contacts'
CREATE TABLE IF NOT EXISTS contacts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    message TEXT NOT NULL
);