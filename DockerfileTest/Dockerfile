# NOT FINISED!

# Intention: Build a Dockerfile to facilitate Flask, Python3 and Nginx with UWSGI

FROM ubuntu

ENV TZ=Europe/Amsterdam
ENV DEBIAN_FRONTEND=nonintercative

# Install Alpine packages
RUN apt-get update \
    && apt-get dist-upgrade -y \
    && apt-get install -y \
        python3 \
        python3-pip \
        python3-dev \
        python3-setuptools \
        python3-venv \
        build-essential \
        libssl-dev \
        libffi-dev \
        nginx \
        sqlite

# Install Python3 packages
RUN pip3 install \
        wheel \
        flask \
        uwsgi \
        unidecode

# Expose ports
EXPOSE 80
EXPOSE 443

