FROM php:7-fpm

ENV TZ=Europe/Amsterdam
ENV DEBIAN_FRONTEND=nonintercative

WORKDIR "/app"

RUN apt-get update \
    && apt-get update \
    && apt-get -y --no-install-recommends install \
        git \
        unzip \
    && php -r "readfile('http://getcomposer.org/installer');" | php -- --install-dir=/usr/bin/ --filename=composer \
    && rm -rf /var/lib/apt/lists/*