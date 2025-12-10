FROM php:8.3-apache

# 1. Enable Apache rewrite module (already good)
RUN a2enmod rewrite

# 2. Install Dependencies and PHP Extensions
# Crucially, libxml2-dev enables 'ext-xml' and 'ext-dom'.
# Add the GD dependencies: libpng-dev, libjpeg-dev, and libfreetype6-dev
RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    unzip \
    curl \
    pkg-config \
    libssl-dev \
    libcurl4-openssl-dev \
    libicu-dev \
    libzip-dev \
    libxml2-dev \
    libreadline-dev \
    libonig-dev \
    zlib1g-dev \
    procps \
    nano \
    supervisor cron sudo \
    # === REQUIRED FOR GD EXTENSION ===
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    # ===============================
 && rm -rf /var/lib/apt/lists/*

# 3. Configure and Install Required PHP Extensions for Laravel
# xml and dom are bundled with the core, installing libxml2-dev enables them.
# mbstring and pcntl are often required by Laravel packages (like Pint/Artisan).
# bcmath is standard for Laravel payment/math operations.
# gd is common for image manipulation.
# sockets is already installed.
RUN docker-php-ext-configure pdo_mysql --with-pdo-mysql=mysqlnd \
 && docker-php-ext-configure intl \
 && docker-php-ext-install pdo pdo_mysql mysqli intl opcache zip sockets \
    bcmath \
    gd \
    mbstring \
    pcntl \
    xml \
    dom \
    curl \
 && docker-php-ext-enable opcache

# 4. Install Redis extension (Crucial for Laravel Caching/Queues)
# Ensure you have 'libsodium-dev' for dependencies if installing through pecl
RUN apt-get update && apt-get install -y libsodium-dev
RUN pecl install redis \
 && docker-php-ext-enable redis

# 5. Install MongoDB driver (as per original file)
# The extension name in php.ini should be just 'mongodb'.
RUN pecl install mongodb \
 && docker-php-ext-enable mongodb

# 6. Install Composer (already good, using the latest stable version)
# Using 'composer:latest' is more robust than 'composer:2.0'
COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer

# 7. Install Xdebug (as per original file)
RUN pecl install xdebug \
 && docker-php-ext-enable xdebug

# 8. Set permissions for Apache and Laravel storage (Apache user is 'www-data')
RUN chown -R www-data:www-data /var/www/html/

# 9. Set Working Directory
WORKDIR /var/www/html