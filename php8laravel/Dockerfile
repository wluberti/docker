FROM php:8-fpm-buster

ENV TZ=Europe/Amsterdam
ENV DEBIAN_FRONTEND=nonintercative

# hack to allow PHP packages to be installed
RUN rm /etc/apt/preferences.d/no-debian-php

RUN apt-get update \
    && apt-get -y install \
        git \
        unzip \
        wget \
        curl \
        lsb-release ca-certificates apt-transport-https software-properties-common gnupg2 \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/*

RUN wget -qO - https://packages.sury.org/php/apt.gpg | apt-key add - \
    && echo "deb https://packages.sury.org/php/ buster main" | \
        tee /etc/apt/sources.list.d/php.list \
    && echo "deb http://security.debian.org/debian-security buster/updates main " | \
        tee -a /etc/apt/sources.list.d/php.list

RUN apt-get update --fix-missing -y \
    && apt-get dist-upgrade -y \
    && apt-get install -y -q \
       supervisor sqlite3 libcap2-bin libpng-dev \
       php8.2-fpm php8.2-dev \
       php8.2-pgsql php8.2-sqlite3 php8.2-gd \
       php8.2-memcached \
       php8.2-imap php8.2-mysql php8.2-mbstring \
       php8.2-xml php8.2-zip php8.2-bcmath php8.2-soap \
       php8.2-intl php8.2-readline \
       php8.2-msgpack php8.2-igbinary php8.2-ldap \
       php8.2-redis \
    && php -r "readfile('http://getcomposer.org/installer');" | php -- --install-dir=/usr/bin/ --filename=composer \
    && curl -sL https://deb.nodesource.com/setup_16.x | bash - \
    && apt-get install -y -q nodejs \
    && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" > /etc/apt/sources.list.d/yarn.list \
    && apt-get update \
    && apt-get install -y -q yarn \
    && apt-get install -y -q postgresql-client \
    && apt-get -y autoremove \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN pecl channel-update https://pecl.php.net/channel.xml \
    && pecl install swoole

COPY php.ini /etc/php/8.1/cli/conf.d/99-sail.ini

RUN docker-php-ext-install pdo_mysql pdo

WORKDIR /usr/local/bin

RUN dpkgArch="$(dpkg --print-architecture)"; \
    wget https://github.com/fabpot/local-php-security-checker/releases/download/v2.0.4/local-php-security-checker_2.0.4_darwin_${dpkgArch} -o local-php-security-checker \
    && chmod +x local-php-security-checker

WORKDIR /var/www/html