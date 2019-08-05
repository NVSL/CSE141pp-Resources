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
2. The [starter repo](https://github.com/NVSL/CSE141pp-Introduction-to-the-Development-Environment.git) for this lab (Don't clone it until the start of class, last minute changes are likely).
3. The contents of the class materials Github repo: https://github.com/NVSL/CSE141pp_Resources

## Tasks to Perform

### Fill Out The Self Evaluation

Login to your __@ucsd.edu__ gmail account and fill out [this survey]().  You will receive
a copy of your responses via email.  Print it to a pdf and include it in your repo as `survey.pdf`.

### Get set up Github

We are going to use Github classroom for this course. You'll need to [create a Github account](https://github.com/), if you don't already have one. 
For each part of the project, there will be an assignment setup on Github. 
You and your teammates will commit your work to the repo in order to turn it in.

First, you'll need to authorize github classroom to access your github account. 
To do that, visit https://classroom.github.com and sign in with your github account.

Then click on the link for the starter repo listed in the "Software You Will Need" section above. (Not able to verify this!)

We will be using Github a lot in class. 
If you aren't familiar with it, there are a bunch of good introductory tutorials. 
For example, [this one](http://try.github.io/).

### Install Docker

https://docs.docker.com/install/

### Do the Docker Hello World tutorial

https://docs.docker.com/get-started/

Take a screenshot of the command line output of the `docker run hello-world` step of the tutorial.

### Get a Copy of the Starter Code

Fork a copy of the starter repo on Github.

Git clone the forked repo locally (`git clone https://github.com/username/CSE141pp-Introduction-to-the-Development-Environment`).

There are two folder containing code in this repo.
- lab files: Code that you will not modify. This contains `main()`, a function that will call and test your code.
- submission: Code that you will modify. This contains some functions called by `main()`.

There is also a Makefile in submission that you will use to build the code. You should not modify the Makefile.

### Test the Starter Code Locally

Before building the code locally, you must start the development environment Docker container (devonmerrill/cse141l-development-environment).

You will want to mount your repo as a volume in the container using the --volume option.

The full command to start the Docker container looks something like this:
```
docker run -it \
--volume ~/CSE141pp-Introduction-to-the-Development-Environment:/runner/CSE141pp-Introduction-to-the-Development-Environment \
devonmerrill/cse141l-development-environment
```
You might want to save this as a script for easy reuse.

This will start the Docker container in interactive mode (`-i`) and give you access to a terminal (`-t`).

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

Don't worry about the points reported on Gradescope. We are only using the autograder to gather the data in `code-stats.csv`.


## Turn in Your Work

Create a GitHub Tag for your repository once you’ve done the final commits. 

We will look at your repo and code.

### Rubric

Checklist:

1. Output of Docker "Hello World" tutorial (commited to your repo as `docker-hello-world.txt`) (1 pt)
2. Output file of starter code local run (commited to your repo as `submission/starter-output.txt`) (1 pt)
3. Output file of instrumentation script cloud run (commited to your repo as `submission/reference-code-stats.csv`) (1 pt)
4. Complete and submit to Gradescope (5 pts)

