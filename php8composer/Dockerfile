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
    && apt-get autoremove -y \
    && php -r "readfile('http://getcomposer.org/installer');" | php -- --install-dir=/usr/bin/ --filename=composer \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /usr/local/bin

RUN wget https://github.com/fabpot/local-php-security-checker/releases/download/v1.0.0/local-php-security-checker_1.0.0_linux_amd64 -o local-php-security-checker \
    && chmod +x local-php-security-checker