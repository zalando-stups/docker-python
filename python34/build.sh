#!/bin/bash

VER=$(cat VERSION)

docker build -t zalando/python:$VER .

SQUASH_PATH=$(which docker-squash)

if [ -z "$SQUASH_PATH" ]; then
    # install Docker Squash from https://github.com/jwilder/docker-squash
    TGZ=docker-squash-linux-amd64-v0.1.0.tar.gz
    wget https://github.com/jwilder/docker-squash/releases/download/v0.1.0/$TGZ
    sudo tar -C /usr/local/bin -xzvf $TGZ
    rm $TGZ
fi

echo 'Squashing the base image to save space..'
docker save zalando/python:$VER | sudo docker-squash -from root -t zalando/python:$VER | docker load
