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

RUN dpkgArch="$(dpkg --print-architecture)"; \
    wget https://github.com/fabpot/local-php-security-checker/releases/download/v2.0.4/local-php-security-checker_2.0.4_darwin_${dpkgArch} -o local-php-security-checker \
    && chmod +x local-php-security-checker