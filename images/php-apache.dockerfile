 # syntax=docker/dockerfile:1
FROM php:8.0.8-apache

# Update OS and install common dev tools
RUN apt-get update
RUN apt-get install -y wget neovim git zip unzip zlib1g-dev libzip-dev libpng-dev

# Install PHP extensions needed
RUN docker-php-ext-install -j$(nproc) mysqli pdo_mysql gd zip pcntl exif

# Enable common Apache modules
RUN a2enmod headers expires rewrite

# Link local dotfiles for consistent CLI (optional)
#RUN ln -s /var/www/dotfiles/.gitignore_global ~/.gitignore_global
#RUN echo 'source ~/.bash_profile' >> ~/.bashrc

# Install Composer
COPY --from=composer:2 /usr/bin/composer /usr/local/bin/composer

# Set working directory to web files
WORKDIR /var/www
