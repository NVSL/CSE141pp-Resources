# Introduction to the Development Environment

To be completed on your own. Complete this lab in the first week is necessary for passing the course.

Check the course schedule for due date(s).

Skills to Learn

1. Install and use Docker
2. GitHub basics
3. Running the lab scripts
4. Running a job on the remote servers

## Software You Will Need

1. A computer with Docker installed (either the basement CSE labs, or your own laptop).
2. The [starter repo]() for this lab (Don't clone it until the start of class, last minute changes are likely).
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

Take a screenshot of the command line output of the '''docker run hello-world''' step of the tutorial.

### Running the Course Instrumentation Script Locally

Fork a copy of the starter repo on Github.

Git clone the forked repo locally (```git clone https://github.com/username/CSE141pp_Introduction-to-the-Development-Environment```).

Run the default instrumentation script locally with __TODO__```command```.

Take a screenshot of the command line output of the instrumentation script.

Save output file of the instrumentation script as ```local_output.txt``` and commit it to your lab repo fork.

### Running the Course Instrumentation Script in the Cloud

Log into Gradescope. 

Make a submission to the Gradescope assigment "Lab 0 Introduction to the Development Environment" using the newly forked repo.

Review the output of the autograder. The autograde will run a more detailed version of the instrumentation script.

Compare this output with the output of the local instrumentation script.

Save output file of the 

script as ```reference_processor_output.txt``` and commit it to your lab repo fork.


## Turn in Your Work
Write up pdf will be submitted through Gradescope.

Also, create a GitHub Tag for your repository once you’ve done the final commits. 
Enter this detail in the submission under “Tag”.
We will look at your repo and code.

### Rubric

Checklist:

1. Screenshot of Docker "Hello World" tutorial completed (1 pt)
2. Screenshot of instrumentation script successfully run locally (1 pt)
3. Output file of instrumentation script local run (commited to your repo as ```local_output.txt```) (1 pt)
4. Screenshot of instrumentation script successfully run in the cloud (1 pt)
5. Output file of instrumentation script cloud run (commited to your repo as ```reference_processor_output.txt```) (1 pt)
6. Complete "lab0.pdf" and submit to Gradescope (5 pts)

