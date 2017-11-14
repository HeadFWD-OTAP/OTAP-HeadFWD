#!/usr/bin/env bash

set -ex

source ./pipeline-it-exports.sh


docker-compose -f docker-compose-it.yml down -v