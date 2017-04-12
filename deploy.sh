#!/usr/bin/env bash

mkdir ~/deploy
cp deployment-assets/* ~/deploy
cd ~/deploy

git clone https://github.com/JackWFinlay/JackWFinlay.github.io.git
git clone https://github.com/JackWFinlay/Blog-Engine.git

docker-compose up

# rm nginx-conf/default.conf
cp challenge.conf nginx-conf

docker-compose run --rm letsencrypt \
  letsencrypt certonly --webroot \
  --email jack@jackfinlay.com --agree-tos \
  -w /var/www/letsencrypt -d depthcharge.co

docker-compose kill -s SIGHUP proxy

# docker build -t nginxserverimage .
# docker run --name nginxserver -P -d nginxserverimage