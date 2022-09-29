#!/usr/bin/env bash

#echo 'The following Maven command installs your Maven-built Java application'
#echo 'into the local Maven repository, which will ultimately be stored in'
#echo 'Jenkins''s local Maven repository (and the "maven-repository" Docker data'
#echo 'volume).'
#set -x
#mvn jar:jar install:install help:evaluate -Dexpression=project.name
#set +x
#
#echo 'The following complex command extracts the value of the <name/> element'
#echo 'within <project/> of your Java/Maven project''s "pom.xml" file.'
#set -x
#NAME=`mvn help:evaluate -Dexpression=project.name | grep "^[^\[]"`
#set +x
#
#echo 'The following complex command behaves similarly to the previous one but'
#echo 'extracts the value of the <version/> element within <project/> instead.'
#set -x
#VERSION=`mvn help:evaluate -Dexpression=project.version | grep "^[^\[]"`
#set +x
#
#echo 'The following command runs and outputs the execution of your Java'
#echo 'application (which Jenkins built using Maven) to the Jenkins UI.'
#set -x
#java -jar target/${NAME}-${VERSION}.jar

set -x
host=$(cat /etc/docker-registry/host)
LOCAL_TAG=redis-ci
REMOTE_TAG=$host/$LOCAL_TAG
ENV=$1

echo ENV

container_id=$(docker ps | grep redis-ci | awk {'print $1'})
echo $container_id
if [ "${container_id}" != "" ] ; then
        docker stop $container_id
        docker rm $container_id
fi
docker pull $REMOTE_TAG
docker run -d -p 8088:8088 --name redis-ci $REMOTE_TAG
docker image prune -f