V=0.10

docker pull $DOCKER_IMAGE

docker run -it \
       --volume $HOME:$HOME \
       --volume /tmp:/tmp \
       --volume /var/run/docker.sock:/var/run/docker.sock \
       --privileged \
       -e HOME=$HOME \
       -e PS1='${HOSTNAME}:$PWD ' \
       --hostname $(hostname)-DOCKER \
       -w $HOME \
       $DOCKER_IMAGE
