FROM php:8-fpm

ENV TZ=Europe/Amsterdam \
    DEBIAN_FRONTEND=noninteractive \
    COMPOSER_ALLOW_SUPERUSER=1

# Install system dependencies and PHP extensions (curl, pdo_sqlite and sqlite3 are built into the base image)
RUN apt-get update -y && apt-get dist-upgrade -y \
    && apt-get install -y \
        git \
        unzip \
        wget \
        curl \
        sqlite3 \
    && docker-php-ext-install pdo_mysql \
    && apt-get autoremove -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install Composer (official recommended way)
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Install local-php-security-checker
RUN ARCH=$(dpkg --print-architecture) && \
    wget -O /usr/local/bin/local-php-security-checker "https://github.com/fabpot/local-php-security-checker/releases/download/v2.1.3/local-php-security-checker_linux_${ARCH}" && \
    chmod +x /usr/local/bin/local-php-security-checker

WORKDIR /var/www/html
