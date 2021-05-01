FROM php:8-fpm

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
        ca-certificates \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/*

RUN wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg \
    && echo "deb https://packages.sury.org/php/ stretch main" | \
        tee /etc/apt/sources.list.d/php.list \
    && echo "deb http://security.debian.org/debian-security stretch/updates main " | \
        tee -a /etc/apt/sources.list.d/php.list \
    && apt-get update --fix-missing -y \
    && apt-get dist-upgrade -y \
    && apt-get install -y \
       supervisor sqlite3 libcap2-bin libpng-dev python2 \
       php8.0-cli php8.0-dev \
       php8.0-pgsql php8.0-sqlite3 php8.0-gd \
       php8.0-memcached \
       php8.0-imap php8.0-mysql php8.0-mbstring \
       php8.0-xml php8.0-zip php8.0-bcmath php8.0-soap \
       php8.0-intl php8.0-readline \
       php8.0-msgpack php8.0-igbinary php8.0-ldap \
       php8.0-redis \
    && php -r "readfile('http://getcomposer.org/installer');" | php -- --install-dir=/usr/bin/ --filename=composer \
    && curl -sL https://deb.nodesource.com/setup_15.x | bash - \
    && apt-get install -y nodejs \
    && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" > /etc/apt/sources.list.d/yarn.list \
    && apt-get update \
    && apt-get install -y yarn \
    # && apt-get install -y mysql-client \
    && apt-get install -y postgresql-client \
    && apt-get -y autoremove \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN pecl channel-update https://pecl.php.net/channel.xml \
    && pecl install swoole

COPY php.ini /etc/php/8.0/cli/conf.d/99-sail.ini

RUN docker-php-ext-install pdo_mysql pdo

WORKDIR /usr/local/bin

RUN wget https://github.com/fabpot/local-php-security-checker/releases/download/v1.0.0/local-php-security-checker_1.0.0_linux_amd64 -o local-php-security-checker \
    && chmod +x local-php-security-checker

WORKDIR /var/www/html