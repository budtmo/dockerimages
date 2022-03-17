#!/bin/bash

IMAGE_NAME="budtmo/squid-cntlm"

if [ -z "$1" ]; then
    read -p "Ubuntu Base-Image : " BASE
else
    BASE=$1
fi

if [ -z "$2" ]; then
    read -p "Tool version: " TOOL_VERSION
else
    TOOL_VERSION=$2
fi

if [ -z "$3" ]; then
    read -p "Release version: " RELEASE_VERSION
else
    RELEASE_VERSION=$3
fi

docker build -t ${IMAGE_NAME}:${RELEASE_VERSION} \
	--build-arg BASE_IMAGE=${BASE} \
	--build-arg TOOL_VERSION=${TOOL_VERSION} \
	--build-arg RELEASE_VERSION=${RELEASE_VERSION} .
docker push ${IMAGE_NAME}:${RELEASE_VERSION}
docker tag ${IMAGE_NAME}:${RELEASE_VERSION} ${IMAGE_NAME}:latest
docker push ${IMAGE_NAME}:latest
