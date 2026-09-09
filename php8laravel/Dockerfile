FROM php:8.5-fpm

ENV TZ=Europe/Amsterdam
ENV DEBIAN_FRONTEND=noninteractive

# hack to allow PHP packages to be installed
RUN rm /etc/apt/preferences.d/no-debian-php

RUN apt-get update \
    && apt-get dist-upgrade -y \
    && apt-get -y -q install \
        git \
        unzip \
        wget \
        curl \
        lsb-release ca-certificates apt-transport-https gnupg2 \
        supervisor sqlite3 libcap2-bin libpng-dev \
        php-fpm php-dev \
        php-pgsql php-sqlite3 php-gd \
        php-memcached \
        php-mysql php-mbstring \
        php-xml php-zip php-bcmath php-soap \
        php-intl php-readline \
        php-msgpack php-igbinary php-ldap \
        php-redis \
    && apt-get install -y -q nodejs yarnpkg postgresql-client \
    && ln -s /usr/bin/yarnpkg /usr/bin/yarn \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY php.ini /etc/php/8.4/cli/conf.d/99-sail.ini

RUN docker-php-ext-install pdo_mysql pdo

# Install Composer (official recommended way)
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Install local-php-security-checker
RUN ARCH=$(dpkg --print-architecture) && \
    wget -O /usr/local/bin/local-php-security-checker "https://github.com/fabpot/local-php-security-checker/releases/download/v2.1.3/local-php-security-checker_linux_${ARCH}" && \
    chmod +x /usr/local/bin/local-php-security-checker

WORKDIR /var/www/html