#!/usr/bin/env bash

git clone https://github.com/JackWFinlay/JackWFinlay.github.io.git

mkdir ~/deploy
cp Dockerfile ~/deploy
cd ~/deploy

docker build -t nginxserverimage .
docker run --name nginxserver -P -d nginxserverimage





