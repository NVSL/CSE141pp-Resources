# CSE141pp_server_utils

These are some scripts to setup and run a new packet.com lab grading server.
Also, this repo should work as a Gradescope autograder to talk to the packet servers.

This has been tested on Ubunut 16.04.

## Manual Server Setup

### Create a New Server

1.  Go to http://packet.com.  `Login->New Server->On Demand`.
2.  Select a hostname, and then find a location that has `x1.small.x86` instances available.
3.  Choose Ubuntu 16.04.
4.  Click `Deploy Servers`.

### Install software

On a fresh server download and run `packet_server_setup.sh`. This will setup the rest of the tools:

```curl https://raw.githubusercontent.com/NVSL/CSE141pp_server_utils/master/packet_server_setup.sh?token=ACFGBXJY2PRWQSIVOVW3R4C5XCPI6 | bash ```

It will take a while, and you'll be prompted twice for credentials to connect to github.

When it is done, it will reboot the server.  When it comes up, proceed to the next section.


## Building the Devel Docker Image

To build  the development docker image:

```
./build_docker.sh
```

This will take a while.

## Automatic Setup

Follow the directions above, but instead of "Deploy Servers", click "Configure"
and enter the contents of `bootstrap_server.sh` into the "Add optional user
data" box. You'll need to fill in the value for `GIT_OAUTH` based on the
contents of `https://github.com/NVSL/CSE141pp-Secrets/blob/master/oauth_token`.

Then click "Save" and "Deploy Servers". This will install the software and build the docker image.

## Testing

To make sure everything is working properly, you should be able to start our container:

``` docker run -v /root:/root -it cse141pp/submission-runner:0.10 ```

This will start the container with `/root` from outside the container mapped to
`/root` inside the container.  So changes you made in `/root` will persist.

## Lab Setup

You can then set ```STUDENT_ID``` ```STUDENT_REPO``` ```INSTRUCTOR_ID``` ```LAB_REPO```.
This should be the github id of the student, student submission, github id of the instructor, and lab repo.
The lab repo should be based on [CSE141pp_Example_Lab_1](https://github.com/djmerrill/CSE141pp_Example_Lab_1).
(In particular with the ```make pcm_submission``` target in the Makefile.)

## Grading a Submission
Submissions are graded by copying the student's ```$STUDENT_REPO/submission``` dir 
into ```$LAB_REPO/submission``` and calling ```make pcm_submission```.

To actually run the submission, use ```grade_submission.sh```. 
It should be in the PATH and it should take care of moving to the right directories, 
but I've been running it from ```/root```.

The ```make pcm_submission``` target will be called on the lab in a Docker container.
The result must be in ```/root/lab/submission/result.out```. This is the only file that will be preserved from the run.

## Gradescope Autograder
To use as an autograder:
  download the repo
  add the credential json file
  zip up all the files (file must be in root of the zip)
  upload to gradescope


## Getting Started on Docker

To push the devel/job runner docker image to docker.com so it's available publicly do this:

1.  Create an account at docker.com.
2.  Log in.
3.  Setup the connection to your github account.
3.  Click 'Create Repository'.  We'll call it 'cse141pp'
4.  Make it public.
5.  Attach your git hub account to, in our case, the CSE141pp_server_utils repo.
6.  Configure the build and kick it off.
7.  When it finishes you should be able to do something like `docker run -v /root:/root -it stevenjswanson/cse141pp:latest'

## Useful Web Pages

1.  PCM API Spec:https://intel-pcm-api-documentation.github.io/classPCM.html
