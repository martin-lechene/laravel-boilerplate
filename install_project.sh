#!/bin/bash

# Install Composer
echo "Installing Composer..."
wget https://getcomposer.org/composer.phar
chmod +x composer.phar
sudo mv composer.phar /usr/local/bin/composer

# Install Node.js and npm
echo "Installing Node.js and npm..."
sudo yum install -y npm

# Clone repository
echo "Cloning repository..."
git clone https://github.com/Labs64/laravel-boilerplate.git

# Change into the working directory
echo "Changing into laravel-boilerplate directory..."
cd laravel-boilerplate

# Copy .env.example to .env
echo "Copying .env.example to .env..."
cp .env.example .env

# Modify .env according to your environment
# You may need to manually edit .env file

# Install composer dependencies
echo "Installing composer dependencies..."
composer install --prefer-dist

# Generate application key
echo "Generating application key..."
php artisan key:generate

# Install other dependencies using npm
echo "Installing other dependencies using npm..."
npm install

# Compile assets
echo "Compiling assets..."
npm run dev

# Create tables and seed data
echo "Creating tables and seeding data..."
php artisan migrate --seed

echo "Setup completed successfully!"
