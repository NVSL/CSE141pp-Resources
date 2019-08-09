# Characterizing Matrix Multiplication

This code computes the matrix product of two square matrices of the same size.
This time you will gather data enery and execution time data while you for various processor setting and input size.

This lab will be completed on your own.

Check the course schedule for due date(s).

Skills to Learn

1. Use the class instrumentation tools to change processor speed
2. Measure program runtime
3. Measure program energy usage
4. Calculate power and anwser other questions using gathered data
5. Make good graphs from gathered data


## Software You Will Need

1. A computer with Docker installed (either the cloud docker container via ssh, or your own laptop).
2. The [starter repo](https://classroom.github.com/a/w0TawKC9) for this lab (Don't clone it until the start of class, last minute changes are likely).
3. The contents of the class materials Github repo: https://github.com/NVSL/CSE141pp-Resources

## Tasks to Perform

### Setup

Fork the starter repo for this lab.

### Run the Stater Code Locally and Verify the Output

First, accept the assignement on Github Classroom: https://classroom.github.com/a/w0TawKC9

This will set you up with a copy of the starter repository.

`git clone` your repo locally.

There are two folder containing code in this repo.
- lab files: Code that you will not modify. This contains `main()`, a function that will call and test your code.
- submission: Code that does most of the computation via the `sqmm()` function. You will not modify the code for this lab.

There is also a Makefile in submission that you will use to build the code. You should not modify the Makefile.


### Test the Starter Code Locally

As you did in Lab 0, navigate to the clone of your repo while inside the course development environment docker image.

In the `submission` directory, run make. This should produce `code.exe` as you saw in Lab 0.

Take a look at `lab.make` in the root of the repo. This is the make file used when your repo is run on the reference processor. It indicates the command line arguments that will be passed during the reference run:
`CMD_LINE_ARGS=--engine papi --stat PAPI_L2_STM --stat rapl:::PACKAGE_ENERGY:PACKAGE0 --mat-small 96 --mat-large 768 --iterations 5`.

The arguments `--engine papi --stat PAPI_L2_STM --stat rapl:::PACKAGE_ENERGY:PACKAGE0` are used on the reference processor to measure cache and energy information. Don't use them locally.

These arguments are parsed by `lab_files/main.cpp`.

Run a single execution of `code.exe` with command line arguments to run 10 iterations of matrix multiply on two 32x32, 64x64, and 128x128 matricies. The command line arguments to do this look like `--mat-small 32 --mat-large 128 --iterations 10`.

Save the ouput as `local-output.txt` in the root of your repo and commit and push the file.


### Running at 1 GHz

Take a look at the file `config` in the root of the repo.

This file lets you change how the code will be built and run on the reference processor.

Change the MHz option to `1000` and commit and push the change.

Now submit your repo to the Gradescope autograder to run on the reference processor.

Save, commit, and push the output of `submission/code-stats.csv` as `1000-MHz-stats.csv` in the root of your repo.


### Gathering Data

Rerun the code at 1200 MHz, 1400 MHz, 1600 MHz, and 1800 MHz.
Make sure you save the output of `submission/code-stats.csv` at each speed. You will use this data in the lab write up.


### Complete the Write Up

The write up template is in you repo as `lab-1-write-up.pdf`.

## Turn in Your Work
Write up pdf will be submitted through Gradescope.

Also, create a GitHub Tag for your repository once you’ve done the final commits. 
We will look at your repo and code.

### Rubric

Checklist:

1. `local-output.txt` commited to repo (1pt)
2. `1000-MHz-stats.csv` commited to repo (1pt)
3. Completed write up submitted on Gradescope (5pt)
