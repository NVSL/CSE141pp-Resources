############
#       This is the container that will be run to download a student repo and set up another container to run the student code in
#       It will then take the output of that container and make a json file to upload as a result
#       It needs git, a way to tell which student repo to download, a way to setup the 
#
#       This image needs to:
#               look in a special dir, ./submission
#               make run in that dir
#               exit
#
#       This file needs to be updated when archlab has a new version so that automated build can happen on Dockerhub
#	Update for multicore
# Update for use dockerhub by default

###########
FROM ubuntu:16.04

# Install any needed packages specified in requirements.txt
RUN apt-get update

RUN apt install -y software-properties-common
RUN apt-get update
RUN add-apt-repository ppa:jonathonf/python-3.6
RUN add-apt-repository ppa:ubuntu-toolchain-r/test

RUN apt-get update --fix-missing

RUN apt-get install -y kmod less git emacs gcc make g++ sysfsutils cpufrequtils numactl lshw dmidecode build-essential acpid linux-tools-generic lm-sensors gdb msr-tools libc6-dev-i386 vim libboost-all-dev curl gfortran clang graphviz  python3-pip python-dev build-essential docker.io man libjpeg-dev unzip libpng-dev cmake 

RUN apt-get install -y linux-headers-$(uname -r) linux-tools-$(uname -r) || true
RUN apt-get install -y gcc-7 g++-7 gcc-8 g++-8 gcc-9 g++-9 
RUN apt-get install -y linux-tools-4.4.0-134-generic

RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-9 90 --slave /usr/bin/g++ g++ /usr/bin/g++-9
RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-8 80 --slave /usr/bin/g++ g++ /usr/bin/g++-8
RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-7 70 --slave /usr/bin/g++ g++ /usr/bin/g++-7

RUN apt-get install -y python3.6
RUN update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.5 1
RUN update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.6 2

RUN apt-get install -y python python-pip python-dev
RUN apt-get install -y python3 python3-pip # this needs to happen before pip3 is used
RUN pip install --upgrade pip
RUN pip install virtualenv
RUN pip3 install --upgrade pip
RUN pip3 install --upgrade virtualenv

# Testing tools
RUN git clone https://github.com/google/googletest.git
RUN (cd googletest;  cmake CMakeLists.txt; make)
ENV GOOGLE_TEST_ROOT /googletest
RUN (git clone https://github.com/bats-core/bats-core.git; cd bats; ./install.sh /usr/local)

# Our software
RUN (git clone https://github.com/NVSL/cse141pp-archlab.git ) 
RUN (cd cse141pp-archlab/; make install-prereqs;)
RUN (cd cse141pp-archlab/; . ./env.sh; git pull; make) # redooo
RUN (cd cse141pp-archlab/archcloud; pip3 install -e .)
ENV ARCHLAB_ROOT /cse141pp-archlab

ENV PATH "$ARCHLAB_ROOT/tools:$ARCHLAB_ROOT/utils:$PATH"
			
RUN (git clone https://github.com/NVSL/CSE141pp-SimpleCNN.git)
RUN (cd CSE141pp-SimpleCNN; make datasets test)
ENV CANELA_ROOT /CSE141pp-SimpleCNN

ENV IN_DOCKER yes

RUN mkdir /runner/
WORKDIR /runner/

