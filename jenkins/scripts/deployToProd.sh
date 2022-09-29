#!/usr/bin/env bash

set -x
host=$(cat /etc/docker-registry/host)
LOCAL_TAG=redis-ci
REMOTE_TAG=$host/$LOCAL_TAG
ENV=$1
PROD_HOST=$(cat /etc/docker-registry/prodhost)

echo ENV

ssh -i /etc/firstECC.pem -o "StrictHostKeyChecking no" -t $PROD_HOST "container_id=$(docker ps | grep redis-ci | awk {'print $1'});
                                                                      if [ "${container_id}" != "" ] ; then
                                                                             docker stop $container_id
                                                                             docker rm $container_id
                                                                      fi;
                                                                      docker pull $REMOTE_TAG;
                                                                      docker run -d -p 8088:8088 --name redis-ci $REMOTE_TAG;
                                                                      docker image prune -f;"

