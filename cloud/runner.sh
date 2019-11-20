#!/usr/bin/env bash

docker run \
       --volume /var/run/docker.sock:/var/run/docker.sock \
       --volume /tmp/:/tmp/ \
       -e SUBMISSION_DIR='/submission' \
       --hostname $(hostname)-RUNNER \
       -w /course/$CONFIG_REPO_ROOT_NAME \
       $DOCKER_IMAGE \
       bash -c 'DEPLOYMENT_MODE=TESTING; . config.sh;  runall.d'



