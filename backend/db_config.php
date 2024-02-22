<?php
// db_config.php

$servername = "mysql";  // Nom du service MySQL dans le docker-compose.yml
$username = "root";
$password = "admin";

try {
    $conn = new PDO("mysql:host=$servername;", $username, $password);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // Création de la base de données 'web' s'il n'existe pas
    $sql = "CREATE DATABASE IF NOT EXISTS web";
    $conn->exec($sql);
    
    // Sélection de la base de données 'web'
    $conn->exec("USE web");

    // Création de la table 'contacts'
    $sql = "CREATE TABLE IF NOT EXISTS contacts (
        id INT AUTO_INCREMENT PRIMARY KEY,
        name VARCHAR(255) NOT NULL,
        email VARCHAR(255) NOT NULL,
        message TEXT NOT NULL
    )";
    $conn->exec($sql);
} catch (PDOException $e) {
    echo "Error: " . $e->getMessage();
}

$conn = null;  // Fermez la connexion après la création
?>