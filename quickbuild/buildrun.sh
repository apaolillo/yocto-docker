#!/bin/bash
set -e

IMAGE_TAG=yocto-quickbuild
CONTAINER_NAME=$IMAGE_TAG

docker build -t $IMAGE_TAG .
docker run \
    --rm \
    -ti \
    --name $CONTAINER_NAME \
    $IMAGE_TAG \
    $@
