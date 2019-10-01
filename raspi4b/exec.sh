#!/bin/bash
set -e

CONTAINER_NAME=yocto-raspi4b

if [[ -z $@ ]]; then
    cmd=bash
else
    cmd=$@
fi

docker exec -ti $CONTAINER_NAME ${cmd}
