FROM php:8.3-fpm

ENV TZ=Europe/Amsterdam
ENV DEBIAN_FRONTEND=nonintercative

# hack to allow PHP packages to be installed
RUN rm /etc/apt/preferences.d/no-debian-php

RUN apt-get update \
    && apt-get dist-upgrade -y \
    && apt-get -y -q install \
        git \
        unzip \
        wget \
        curl \
        lsb-release ca-certificates apt-transport-https software-properties-common gnupg2 \
        supervisor sqlite3 libcap2-bin libpng-dev \
        php-fpm php-dev \
        php-pgsql php-sqlite3 php-gd \
        php-memcached \
        php-imap php-mysql php-mbstring \
        php-xml php-zip php-bcmath php-soap \
        php-intl php-readline \
        php-msgpack php-igbinary php-ldap \
        php-redis \
    && php -r "readfile('http://getcomposer.org/installer');" | php -- --install-dir=/usr/bin/ --filename=composer \
    && apt-get install -y -q nodejs yarn postgresql-client \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY php.ini /etc/php/8.3/cli/conf.d/99-sail.ini

RUN docker-php-ext-install pdo_mysql pdo

WORKDIR /usr/local/bin

RUN dpkgArch="$(dpkg --print-architecture)"; \
    wget https://github.com/fabpot/local-php-security-checker/releases/download/v2.0.4/local-php-security-checker_2.0.4_darwin_${dpkgArch} -o local-php-security-checker \
    && chmod +x local-php-security-checker

WORKDIR /var/www/html