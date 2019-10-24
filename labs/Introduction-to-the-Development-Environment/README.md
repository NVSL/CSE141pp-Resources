# Introduction to the Development Environment

In this lab you set up the lab environment and learn how gather information about programs using the course tools.
You will download some starter code. 
Build and run it in a Docker container. 
Modify the code and push the changes to a git repo.
Run the code in the cloud on our reference processor to gather some data.

This lab will be completed on your own. Completing this lab in a timely manner is necessary for passing this course.

Check the course schedule for due date(s).

Skills to Learn

1. Install and use Docker
2. GitHub basics
3. Building and modifying lab code
4. Running a job on the remote servers

## Software You Will Need

1. A computer with Docker installed (either the basement CSE labs, or your own laptop).
2. The [starter repo](https://github.com/NVSL/CSE141pp-Lab-Introduction-to-the-Development-Environment.git) for this lab (Don't clone it until the start of class, last minute changes are likely).
3. The contents of the class materials Github repo: https://github.com/NVSL/CSE141pp-Resources

## Tasks to Perform

### Fill Out The Self Evaluation

Login to your __@ucsd.edu__ gmail account and fill out [this survey](https://docs.google.com/forms/d/e/1FAIpQLSdQUSYqeVwWctQFrhxXlkQcSutsKWHhTrDdQEa1bowX4tQbWQ/viewform). You do not need to do this again if you already filled it out for CSE 141.

### Get set up Github

We are going to use Github classroom for this course. You'll need to [create a Github account](https://github.com/), if you don't already have one. 
For each part of the project, there will be an assignment setup on Github. 
You and your teammates will commit your work to the repo in order to turn it in.

First, you'll need to authorize github classroom to access your github account. 
To do that, visit https://classroom.github.com and sign in with your github account.

We will be using Github a lot in class. 
If you aren't familiar with it, there are a bunch of good introductory tutorials. 
For example, [this one](http://try.github.io/).

### Install Docker

https://docs.docker.com/install/

If you are using Windows, you may want to use  [Windows Subsystem for Linux](https://docs.microsoft.com/en-us/windows/wsl/install-win10) or use [Docker Toolbox](https://docs.docker.com/toolbox/toolbox_install_windows/).

### Do the Docker Hello World tutorial

https://docs.docker.com/get-started/

Take a screenshot of the command line output of the `docker run hello-world` step of the tutorial.

### (Alternately) Log into the Schools Cloud for Docker

If you are having trouble installing Docker on your own computer, you can instead run it on the schools machines using these steps:

Login to 'ieng6.ucsd.edu' (our primary student Linux SSH server) using you normal student login.

Run the command `cse141s219` to prep the system.

Run the command `launch-141` to connect to a remote Docker container running the development environment image.

After logging into ieng6 it should look something like this:
```
    [...]
    To begin work for one of your courses [ cs141s219 ], type its name 
    at the command prompt.  (For example, "cs141s219", without the quotes).

    To see all available software packages, type "prep -l" at the command prompt,
    or "prep -h" for more options.
    [agt@ieng6-202]:~:462$ cs141s219
    Wed Aug 07, 2019 11:46am - Prepping cs141s219
    [agt@ieng6-202]:~:19$ launch-141
    Attempting to create job ('pod') with 4 CPU cores, 16 GB RAM, and 0 GPU units.
       (Adjust command line options, or edit "/home/linux/ieng6/cs141s219/public/bin/launch-141" to change this configuration.)
    pod "agt-21229" created
    Wed Aug 7 11:46:19 PDT 2019 starting up - pod status: Pending ; 
    Wed Aug 7 11:46:25 PDT 2019 pod is running with IP: 10.47.192.3 on node: its-dsmlp-n25.ucsd.edu
    stevenjswanson/cse141pp:latest:latest is now active.

    Connected to agt-21229; type 'exit' to terminate pod/processes.
    agt@agt-21229:~$ 
```

You can then clone your repo in the directory that you land in and work on it.

__VERY IMPORTANT: Make sure to commit and push your changes before you exit the development environment. Unlike running on your local machine, there is no garuntee that your files will stick around the next time you log in.__

### Get a Copy of the Starter Code

First, accept the assignement on Github Classroom: https://classroom.github.com/a/XwRB7jHX

This will set you up with a copy of the starter repository.

`git clone` your repo locally.

There are two folder containing code in this repo.
- lab files: Code that you will not modify. This contains `main()`, a function that will call and test your code.
- submission: Code that you will modify. This contains some functions called by `main()`.

There is also a Makefile in submission that you will use to build the code. You should not modify the Makefile.

### Test the Starter Code Locally

Before building the code locally, you must start the development environment Docker container (stevenjswanson/cse141pp:latest).

You will want to mount your repo as a volume in the container using the --volume option.

The full command to start the Docker container looks something like this:
```
docker run -it \
--volume ~/lab-0-intro-to-the-development-environment-djmerrill:/runner/lab-0-intro-to-the-development-environment-djmerrill \
stevenjswanson/cse141pp:latest
```
You might want to save this as a script for easy reuse. If you didn't clone the repo into your Unix home directory, you will have to change this command.

This will start the Docker image (`stevenjswanson/cse141pp:latest`) in a container in interactive mode (`-i`) and give you access to a terminal (`-t`).

The lab repo will be mounted in the container at `/runner/CSE141pp_Introduction-to-the-Development-Environment`.

Navigate to `/runner/CSE141pp_Introduction-to-the-Development-Environment/submission` and run `make`.
This will build the starter code.

You can run the starter code binary which is named `code.exe`.

Save the output of this binary as `submission/starter-output.txt`.

Commit to Github.
- `git add starter-output.txt`,
- `git commit -m 'starter output'`,
- `git push`

### Modify the Starter Code

Open up `code.c` and modify it to print your name when called. Don't forget the `\n`.

Make and run the code again.

Push your changes to Github.
- `git add code.c`,
- `git commit -m 'added a printf'`,
- `git push`

### Running the Course Instrumentation Script in the Cloud

The Gradescope autograder is able to run some detailed tests on your code on our reference processor (Intel E3-1578L Skylake). In this lab we will measure execution time and energy.

Log into Gradescope. 

Make a submission to the Gradescope assigment "Lab 0 Introduction to the Development Environment" using your newly forked repo.

Review the output of the autograder.

There are several outputs. Save and commit `submission/code-stats.csv` from the autograder to your repo as `submission/reference-code-stats.csv`. This is a comma-seperated-values (CSV) file with some information about how the program ran.

Don't worry about the points reported on Gradescope by the autograder. We are only using the autograder to gather the data in `code-stats.csv`.


## Turn in Your Work

Create a GitHub Tag for your repository once you’ve done the final commits. 

We will look at your repo and code.

### Rubric

Checklist:

1. Output of Docker "Hello World" tutorial (commited to your repo as `docker-hello-world.txt`) (0 pt, optional but highly recommended)
2. Output file of starter code local run (commited to your repo as `submission/starter-output.txt`) (1 pt)
3. Output file of instrumentation script cloud run (commited to your repo as `submission/reference-code-stats.csv`) (1 pt)

