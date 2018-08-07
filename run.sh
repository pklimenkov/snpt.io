#!/usr/bin/env bash

if ! gem list docker-sync -i; then gem install docker-sync; fi

docker-compose kill
docker-compose build
docker-sync stop
docker-sync start
docker-compose up
