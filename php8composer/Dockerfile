FROM php:8-fpm

ENV TZ=Europe/Amsterdam
ENV DEBIAN_FRONTEND=nonintercative

RUN apt-get update --fix-missing -y \
    && apt-get dist-upgrade -y \
    && apt-get install -y \
        git \
        unzip \
        wget \
        curl \
        libcurl4-openssl-dev \
        sqlite3 \
        libsqlite3-dev \
    && apt-get autoremove -y \
    && php -r "readfile('http://getcomposer.org/installer');" | php -- --install-dir=/usr/bin/ --filename=composer \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /var/www/html

RUN docker-php-ext-install pdo_mysql pdo_sqlite curl