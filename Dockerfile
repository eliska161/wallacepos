# Base Image
FROM php:8.1-apache

# Enable required PHP extensions
RUN docker-php-ext-install pdo pdo_mysql curl gd

# Enable Apache Rewrite Module
RUN a2enmod rewrite

# Set the working directory
WORKDIR /var/www/html

# Copy application files
COPY . .

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install application dependencies
RUN composer install

# Expose port 80
EXPOSE 80

# Start Apache
CMD ["apache2-foreground"]
