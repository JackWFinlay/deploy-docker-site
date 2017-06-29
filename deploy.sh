#!/usr/bin/env bash

mkdir ~/deploy
cp -r deployment-assets/* ~/deploy
cd ~/deploy

git clone https://github.com/JackWFinlay/Depthcharge.Render.git
git clone https://github.com/JackWFinlay/Jsonize-Web.git

# docker-compose run proxy -d

# docker-compose run --rm letsencrypt \
#  certonly --webroot \
#  --email jack@jackfinlay.com --agree-tos \
#  -w /var/www/letsencrypt -d depthcharge.co
docker-compose stop
docker-compose rm -f
docker-compose pull
docker-compose up --build -d
