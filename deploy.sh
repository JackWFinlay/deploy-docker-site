#!/usr/bin/env bash

mkdir ~/deploy
cp -r deployment-assets/* ~/deploy
cd ~/deploy

git clone https://github.com/JackWFinlay/JackWFinlay.github.io.git
git clone https://github.com/JackWFinlay/Blog-Engine.git

# rm nginx-conf/default.conf
#cp ./letsencryptchallenge/default.conf nginx-conf

docker-compose run proxy -d

docker-compose run --rm letsencrypt \
  certonly --webroot \
  --email jack@jackfinlay.com --agree-tos \
  -w /var/www/letsencrypt -d depthcharge.co

docker-compose up -d
cp ./default.conf nginx-conf
docker-compose restart proxy

# docker build -t nginxserverimage .
# docker run --name nginxserver -P -d nginxserverimage