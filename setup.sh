#!/bin/bash

shopt -s dotglob # ensure we can replace the hidden .env file

echo "Setting up EasyPost UI!"

# Database
cp init-db.env.example init-db.env
echo "Enter a password for the root DB user and press Enter: "
read -r ROOTPASS
sed -i '' -e "s/MYSQL_ROOT_PASSWORD=password/MYSQL_ROOT_PASSWORD=$ROOTPASS/g" init-db.env
echo "Enter a password for the easypost-ui DB user and press Enter: "
read -r DBUSERPASS
sed -i '' -e "s/MYSQL_PASSWORD=password/MYSQL_PASSWORD=$DBUSERPASS/g" init-db.env

# EasyPost UI
cd src || exit
cp .env.example .env
sed -i '' -e "s/DB_PASSWORD=password/DB_PASSWORD=$DBUSERPASS/g" .env
docker-compose up -d --build
sleep 10
docker exec -it easypost-ui php artisan key:generate
sleep 50 # wait for the DB to boot up if we haven't already
docker exec -it easypost-ui php artisan migrate

echo "EasyPost UI setup complete."
