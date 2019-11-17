V=0.10

docker run -it \
       --volume $HOME:$HOME \
       --volume /var/run/docker.sock:/var/run/docker.sock \
       -e HOME=$HOME \
       -e PS1='${HOSTNAME}:$PWD ' \
       --hostname $(hostname)-DOCKER \
       -w $HOME\
       stevenjswanson/cse141pp:latest
