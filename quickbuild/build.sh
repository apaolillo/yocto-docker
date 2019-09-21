#!/bin/bash
set -e

IMAGE_TAG=$1

docker build -t $IMAGE_TAG .
