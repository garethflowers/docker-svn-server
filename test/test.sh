#!/usr/bin/env sh
set -xe
export IMAGE_NAME=garethflowers/svn-server

docker build --tag $IMAGE_NAME .

docker run --rm $IMAGE_NAME svn --version

echo "OK"
