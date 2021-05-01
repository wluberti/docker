FROM php:7-fpm

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
        gnupg \
        libzmq3-dev \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/*

RUN wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg \
    && echo "deb https://packages.sury.org/php/ stretch main" | \
        tee /etc/apt/sources.list.d/php.list \
    && echo "deb http://security.debian.org/debian-security stretch/updates main " | \
        tee -a /etc/apt/sources.list.d/php.list \
    && apt update \
    && apt dist-upgrade -y \
    && apt install -y \
        php7.4 \
        php7.4-fpm \
        php7.4-bcmath \
        php7.4-bz2 \
        php7.4-intl \
        php7.4-gd \
        php7.4-mbstring \
        libonig4 \
        php7.4-mysql \
        php7.4-zip \
        php7.4-zmq \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/*

RUN php -r "readfile('http://getcomposer.org/installer');" | php -- --install-dir=/usr/bin/ --filename=composer

RUN echo "extension=/usr/lib/php/20190902/zmq.so" | tee /usr/local/etc/php/conf.d/docker-php-ext-zmq.ini

WORKDIR /var/www/html