V=0.10

IMAGE=stevenjswanson/cse141pp:latest

docker run -it \
       --volume $HOME:$HOME \
       --volume /root/CSE141pp_server_utils:/root/CSE141pp_server_utils \
       --volume /var/run/docker.sock:/var/run/docker.sock \
       --volume /tmp/:/tmp/ \
       --volume /dev/:/dev/ \
       --volume /lib/modules/:/lib/modules/ \
       -e HOME=$HOME \
       -e SUBMISSION_DIR='/submission' \
       -e PUBSUB_TOPIC='CSE141-jobs' \
       -e GOOGLE_CLOUD_PROJECT='ucsdgadgetron' \
       -e PUBSUB_SUBSCRIPTION='CSE141-jobs-subscription' \
       -e GOOGLE_APPLICATION_CREDENTIALS='/root/CSE141pp_server_utils/subscriber_credentials.json' \
       -e PS1='${HOSTNAME}:$PWD ' \
       --hostname $(hostname)-DOCKER \
       --privileged \
       -w $HOME\
       $IMAGE

