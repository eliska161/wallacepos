# Use an official PHP image
FROM php:8.0-apache

# Install dependencies
RUN apt-get update && apt-get install -y \
    zip unzip git curl npm \
    && docker-php-ext-install pdo pdo_mysql

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Set the working directory
WORKDIR /app

# Copy the application code
COPY . /app

# Install PHP and Node.js dependencies
RUN composer install && npm install --prefix api socket.io

# Expose the application port
EXPOSE 10000

# Start the PHP development server
CMD ["php", "artisan", "serve", "--host", "0.0.0.0", "--port", "10000"]
