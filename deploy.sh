#!/usr/bin/env bash

mkdir ~/deploy
cp Dockerfile ~/deploy
cd ~/deploy

git clone https://github.com/JackWFinlay/JackWFinlay.github.io.git

docker build -t nginxserverimage .
docker run --name nginxserver -P -d nginxserverimage





