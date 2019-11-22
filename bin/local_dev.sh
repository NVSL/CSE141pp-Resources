#!/usr/bin/env bash

if [ "$1." != "." ]; then
    IMAGE=$1
else
    IMAGE=$DOCKER_DEVEL_IMAGE
fi
    
docker pull $IMAGE

docker run -it \
       --volume $HOME:$HOME \
       --volume /tmp:/tmp \
       --volume /var/run/docker.sock:/var/run/docker.sock \
       --privileged \
       -e HOME=$HOME \
       -e PS1='${HOSTNAME}:$PWD ' \
       --hostname $(hostname)-DOCKER \
       -w $HOME \
       $IMAGE
