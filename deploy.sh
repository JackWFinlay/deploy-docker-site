#!/usr/bin/env bash

mkdir ~/deploy
cp -r deployment-assets/* ~/deploy
cd ~/deploy

git clone https://github.com/JackWFinlay/JackWFinlay.github.io.git
git clone https://github.com/JackWFinlay/Blog-Engine.git

# rm nginx-conf/default.conf
echo $PWD
cp letsencryptchallenge/app.conf nginx-conf

docker-compose run --rm letsencrypt \
  letsencrypt certonly --webroot \
  --email jack@jackfinlay.com --agree-tos \
  -w /var/www/letsencrypt -d depthcharge.co

docker-compose up -d
cp app.conf nginx-conf
docker-compose restart proxy

# docker build -t nginxserverimage .
# docker run --name nginxserver -P -d nginxserverimage