#!/usr/bin/bash -e

source .env

docker login
docker buildx bake -f build.hcl $@
