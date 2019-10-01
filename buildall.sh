#!/bin/bash
set -e

image_list="base quickbuild raspi4b zybo"

for image_tag in $image_list
do
    pushd $image_tag > /dev/null
    docker build -t yocto-$image_tag .
    popd > /dev/null
done
