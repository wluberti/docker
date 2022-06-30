#!/bin/bash

echo 'Migrate before every start'
python3 /app/manage.py migrate

echo 'runserver'
python3 /app/manage.py runserver 0.0.0.0:8000
