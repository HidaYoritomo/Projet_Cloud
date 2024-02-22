# Image allowing us to run PHP 8.2 with Apache
FROM php:8.2-apache

# Set the working directory to /var/www/html
COPY frontend/ /var/www/html/

# Exécutez le script SQL pour créer la table lors du démarrage du conteneur
COPY backend/create_table.sql /docker-entrypoint-initdb.d/

# Install dependencies for PHP extensions
RUN apt-get update && apt-get upgrade -y
RUN docker-php-ext-install pdo pdo_mysql  && docker-php-ext-enable pdo pdo_mysql
RUN docker-php-ext-install mysqli && docker-php-ext-enable mysqli

# Expose port 80 to the Docker host, so we can access it
EXPOSE 80

# Copy all the directory contents into the container at /var/www/html
COPY . .