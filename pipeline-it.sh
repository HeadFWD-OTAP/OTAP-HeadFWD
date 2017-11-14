#!/usr/bin/env bash

set -ex

source ./pipeline-it-exports.sh

docker-compose -f docker-compose-it.yml down -v
docker-compose -f docker-compose-it.yml pull
docker-compose -f docker-compose-it.yml build
sudo docker-compose -f docker-compose-it.yml up -d

./pipeline-it-setup.sh


docker-compose -f docker-compose-it.yml run app_it
#docker build -t ${IMAGE_BUILD_TAG} .