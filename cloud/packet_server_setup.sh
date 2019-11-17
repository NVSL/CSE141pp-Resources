#!/bin/bash

###############################################################################
#	This script sets up a packet server
#	These servers will run the student code in a docker image
#	They need to:
#		pull the student code
#		pull the lab code
#		move the student source-code into the lab folder
#		set up a docker instance to run the code
#		run the docker instance
#		get the result/output of the docker instance
#		send off the result/output
#		be in the same state and ready to pull the next student submission
###############################################################################

set -x #print out commands as we execute them.
set -v

export GRADING_TOOLS_REPO=CSE141pp_server_utils
export SECRETS_REPO=CSE141pp-Secrets
export ARCH_LAB_REPO=cse141pp-archlab
export INSTRUCTOR_ID=NVSL
export INSTALL_HOME=/root

# TODO
# https://unix.stackexchange.com/questions/153693/cant-use-userspace-cpufreq-governor-and-set-cpu-frequency
# https://wiki.ubuntu.com/Kernel/KernelBootParameters
#
# maybe add  acpi_enforce_resources=lax to kernel cmdline
###############################################################################
#	To install basic dev tools
###############################################################################

sudo apt-get update
sudo apt-get install -y git emacs
sudo apt-get install -y python python-pip python-dev
sudo apt-get -y install python3 python3-pip # this needs to happen before pip3 is used

sudo pip install --upgrade pip
sudo pip3 install --upgrade pip

sudo pip install virtualenv
sudo pip3 install virtualenv

###############################################################################
#	To install grading tools
###############################################################################
mkdir -p $INSTALL_HOME
pushd $INSTALL_HOME

if [ -e $GRADING_TOOLS_REPO ]; then
  mv $GRADING_TOOLS_REPO "$GRADING_TOOLS_REPO-old-$(date)"
fi

if [ "$GIT_OAUTH." = "." ]; then
    URL=https://github.com/$INSTRUCTOR_ID/$GRADING_TOOLS_REPO
else
    URL=https://$GIT_OAUTH@github.com/$INSTRUCTOR_ID/$GRADING_TOOLS_REPO
fi

git clone $URL

export PATH="$INSTALL_HOME/$GRADING_TOOLS_REPO:$PATH"
popd


###############################################################################
#	To install secrets
###############################################################################

mkdir -p $INSTALL_HOME
pushd $INSTALL_HOME

if [ -e $SECRETS_REPO ]; then
  mv $SECRETS_REPO "$SECRETS_REPO-old-$(date)"
fi

if [ "$GIT_OAUTH." = "." ]; then
    URL=https://github.com/$INSTRUCTOR_ID/$SECRETS_REPO
else
    URL=https://$GIT_OAUTH@github.com/$INSTRUCTOR_ID/$SECRETS_REPO
fi

git clone $URL

popd


###############################################################################
#	Server Utils
###############################################################################

pushd $INSTALL_HOME

if [ -e $GRADING_TOOLS_REPO ]; then
  mv $GRADING_TOOLS_REPO "$GRADING_TOOLS_REPO-old-$(date)"
fi

if [ "$GIT_OAUTH." = "." ]; then
    URL=https://github.com/$INSTRUCTOR_ID/$GRADING_TOOLS_REPO
else
    URL=https://$GIT_OAUTH@github.com/$INSTRUCTOR_ID/$GRADING_TOOLS_REPO
fi

git clone $URL

popd




###############################################################################
#	To install docker
###############################################################################

sudo apt-get install -y \
     apt-transport-https \
     ca-certificates \
     curl \
     gnupg-agent \
     software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo apt-key fingerprint 0EBFCD88

sudo add-apt-repository \
        "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io


###############################################################################
#	MSR for PCM
###############################################################################

modprobe msr

###############################################################################
#       Mount point for iso images (for spec)
###############################################################################

mkdir /mnt/iso



###############################################################################
#	build and install cache control module
###############################################################################

pushd $INSTALL_HOME
apt-get update && apt-get install -y kmod linux-headers-generic build-essential linux-headers-$(uname -r)

if [ "$GIT_OAUTH." = "." ]; then
    URL=https://github.com/$INSTRUCTOR_ID/$ARCH_LAB_REPO
else
    URL=https://$GIT_OAUTH@github.com/$INSTRUCTOR_ID/$ARCH_LAB_REPO
fi  

git clone $URL
cd $ARCH_LAB_REPO/cache_control
make
make modules_install
depmod
modprobe cache_control
echo cache_control >> /etc/modules-load.d/modules.conf
popd

###############################################################################
#	Build Docker image
###############################################################################

pushd $INSTALL_HOME/$GRADING_TOOLS_REPO
bash ./build_docker.sh
popd 

###############################################################################
#	Enable userspace CPU freq control
###############################################################################

if tail -1 /etc/default/grub | grep -vq pstate  ; then 
   echo GRUB_CMDLINE_LINUX=\"\${GRUB_CMDLINE_LINUX} intel_pstate=disable\" >> /etc/default/grub
   update-grub
   reboot
fi


###############################################################################
# To install Google tools
#   This only needs to happen inside docker
###############################################################################

# pip3 install --upgrade google-cloud
# pip3 install --upgrade google-cloud-pubsub
# pip3 install docopt


# pip3 uninstall -y pyasn1
# pip3 install pyasn1

# pip3 install --upgrade google-cloud-datastore


###############################################################################
#	Python virtual env
###############################################################################

###############################################################################
#	To grade https://github.com/$STUDENT_ID/$STUDENT_REPO 
#	as a submission for https://github.com/$INSTRUCTOR_ID/$LAB_REPO
#		
#	cd /root
#	./grade_lab.sh
#
#	Result is in result.out
###############################################################################

# cd /root

# echo "STUDENT_ID=$STUDENT_ID"
# echo "STUDENT_REPO=$STUDENT_REPO"
# echo "INSTRUCTOR_ID=$INSTRUCTOR_ID"
# echo "LAB_REPO=$LAB_REPO"




