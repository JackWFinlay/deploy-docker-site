#!/usr/bin/env bash

mkdir ~/deploy
cp deployment-assets/* ~/deploy
cd ~/deploy

git clone https://github.com/JackWFinlay/JackWFinlay.github.io.git
git clone https://github.com/JackWFinlay/Blog-Engine.git

docker-compose up

# rm nginx-conf/default.conf
# cp nginx.conf nginx-conf
# cp default nginx-conf/sites-available

# docker build -t nginxserverimage .
# docker run --name nginxserver -P -d nginxserverimage