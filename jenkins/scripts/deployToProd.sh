#!/usr/bin/env bash

set -x
host=$(cat /etc/docker-registry/host)
LOCAL_TAG=redis-ci
REMOTE_TAG=$host/$LOCAL_TAG
ENV=$1
PROD_HOST=$(cat /etc/docker-registry/prodhost)

echo ENV

ssh -i /etc/firstECC.pem -o "StrictHostKeyChecking no" -t $PROD_HOST "docker images -q redis-ci && docker stop redis-ci;
                                                                       docker pull $REMOTE_TAG;
                                                                       docker run -d -p 8088:8088 --name redis-ci $REMOTE_TAG;"

