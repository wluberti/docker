FROM php:8-fpm

ENV TZ=Europe/Amsterdam \
    DEBIAN_FRONTEND=noninteractive \
    COMPOSER_ALLOW_SUPERUSER=1

# Install system dependencies and Composer
RUN apt-get update -y && apt-get dist-upgrade -y \
    && apt-get install -y \
        git \
        unzip \
        wget \
        curl \
        sqlite3 \
        libsqlite3-dev \
    && docker-php-ext-install pdo_mysql pdo_sqlite \
    && apt-get autoremove -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install Composer (official recommended way)
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Install local-php-security-checker
RUN ARCH=$(dpkg --print-architecture) && \
    wget -O /usr/local/bin/local-php-security-checker "https://github.com/fabpot/local-php-security-checker/releases/download/v2.0.4/local-php-security-checker_2.0.4_linux_${ARCH}" && \
    chmod +x /usr/local/bin/local-php-security-checker

WORKDIR /var/www/html
