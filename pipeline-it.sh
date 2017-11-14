#!/usr/bin/env bash

set -ex

docker-compose -f docker-compose-it.yml down -v
docker-compose -f docker-compose-it.yml build
docker-compose -f docker-compose-it.yml up -d

sleep 10

docker-compose -f docker-compose-it.yml run app_it
