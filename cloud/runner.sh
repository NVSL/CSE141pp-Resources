#!/usr/bin/env bash

docker run -it \
       --volume /var/run/docker.sock:/var/run/docker.sock \
       --privileged \
       --hostname $(hostname)-RUNNER \
       $DOCKER_IMAGE \
       bash -c 'cd $CONFIG_REPO_ROOT_NAME; export DEPLOYMENT_MODE=TESTING; . config.sh; runlab.d'

