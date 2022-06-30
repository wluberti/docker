#!/bin/bash

echo 'Install all packages'
npm install

echo 'Start and watch NPX for Tailwind'
npx tailwindcss -i /app/static/css/input.css -o /app/static/css/output.css --watch