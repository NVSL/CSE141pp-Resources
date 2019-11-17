#!/bin/bash
GIT_OAUTH=<contents of CSE141pp-Secrets/oauth_token>
curl https://$GIT_OAUTH@raw.githubusercontent.com/NVSL/CSE141pp_server_utils/master/packet_server_setup.sh -O
curl https://$GIT_OAUTH@raw.githubusercontent.com/NVSL/CSE141pp_server_utils/master/build_docker.sh -O
GIT_OAUTH=$GIT_OAUTH bash packet_server_setup.sh
