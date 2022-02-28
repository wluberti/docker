FROM python:3.10

ENV TZ=Europe/Amsterdam
ENV DEBIAN_FRONTEND=nonintercative

WORKDIR "/app"

RUN pip install pip --upgrade

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt
