#!/bin/bash
set -e

IMAGE_TAG=yocto-zybo
CONTAINER_NAME=$IMAGE_TAG

pushd ../quickbuild
./build.sh yocto-quickbuild
popd

docker build -t $IMAGE_TAG .
docker run \
    --rm \
    -ti \
    --name $CONTAINER_NAME \
    $IMAGE_TAG \
    $@
