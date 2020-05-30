#!/usr/bin/env sh
set -e

export DOCKERFILE_PATH=Dockerfile
export IMAGE_NAME=svn-server

source hooks/build

docker run --rm $IMAGE_NAME svn --version

echo "\nOK"
