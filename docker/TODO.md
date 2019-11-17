# Todo

0. Your docker file installs/builds everything each time.  You should build a docker image and reuse it.
1. Move most of packet_server_setup.sh into a Dockerfile.  This will make it faster to spin up a new server and let us do local development.
2. Factor out the pcm-specific parts of the packet_server_setup.sh so we can use the same Dockerfile for local development
3. There's a mechanism with packet to set a script that runs on instance startup.  THe refactored packet_server_setup.sh should be that script.
4. Use `mktemp -d` instead of running everything in `/root`

