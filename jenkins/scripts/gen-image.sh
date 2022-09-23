#!/usr/bin/env bash
set -x

host=$(cat /etc/docker-registry/host)
#echo $(docker -v)

LOCAL_TAG=redis-ci
REMOTE_TAG=$host/$LOCAL_TAG

username=$(cat /etc/docker-registry/username)
password=$(cat /etc/docker-registry/password)

docker login -u $username -p $password

ls ./build/libs

docker build -t $LOCAL_TAG .
docker tag $LOCAL_TAG $REMOTE_TAG
docker push $REMOTE_TAG
