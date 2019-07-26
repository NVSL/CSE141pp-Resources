# Characterizing Matrix Multiplication

To be completed on your own.

Check the course schedule for due date(s).

Skills to Learn

1. Use the class instrumentation tools to change processor speed
2. Use the class instrumentation tools to change compiler options
3. Measure static and dynamic instruction mixes
4. Measure program runtime
5. Measure program energy usage


## Software You Will Need

1. A computer with Docker installed (either the basement CSE labs, or your own laptop).
2. The [starter repo]() for this lab (Don't clone it until the start of class, last minute changes are likely).
3. The contents of the class materials Github repo: https://github.com/NVSL/CSE141pp_Resources

## Tasks to Perform

### Setup

Fork the starter repo for this lab.


### Run the Stater Code Locally and Verify the Output

Run the command ```TODO command``` to compile and run the starter repo with no modifications.

Verify that the program completes without any errors by inspecting the file ```submission/code.out```.
Also inspect the file ```submission/code-stats.csv``` to verify the output of the local insturmentation scripts.


### -O0 vs -O3


#### -O0
Modify the file ```TODO filename``` to add the option ```-O0```.
This tells the compiler to do no optimizations when compiling.

Commit the change to your forked repo and submit to Gradescope.

Save a copy of the output of the autograder in your repo with the filename ```O0_output.txt```.


#### -O3

Modify the file ```TODO filename``` to add the option ```-O3```.
This tells the compiler to optimize the program for speed.
```-O3``` is the default optimization mode and specifying it explicity is optional.

Commit the change to your forked repo and submit to Gradescope.

Save a copy of the output of the autograder in your repo with the filename ```O3_output.txt```.


### Running at 1 GHz

Modify the file ```TODO filename``` to add the option ```TODO speed option for about 1GHz```.
This option limits the processor to a clock frequency of about 1GHz when the program is run.
Not specifying a speed option

Commit the changes to your forked repo and submit to Gradescope.

Save a copy of the output of the autograder in your repo with the filename ```1GHz_output.txt```.



### Running at 2 GHz

Modify the file ```TODO filename``` to add the option ```TODO speed option for about 2GHz```.
This option limits the processor to a clock frequency of about 2GHz when the program is run.

Commit the changes to your forked repo and submit to Gradescope.

Save a copy of the output of the autograder in your repo with the filename ```2GHz_output.txt```.


### Varying Input Size

Change the ```SIZE``` definition in ```lab_files/main.cpp``` to ```1024```.
Commit the changes to your forked repo and submit to Gradescope. Save the output as ```1k_output.txt```.


Change the ```SIZE``` definition in ```lab_files/main.cpp``` to ```10240```.
Commit the changes to your forked repo and submit to Gradescope. Save the output as ```10k_output.txt```.


Change the ```SIZE``` definition in ```lab_files/main.cpp``` to ```20480```.
Commit the changes to your forked repo and submit to Gradescope. Save the output as ```20k_output.txt```.


## Turn in Your Work
Write up pdf will be submitted through Gradescope.

Also, create a GitHub Tag for your repository once you’ve done the final commits. 
Enter this detail in the submission under “Tag”.
We will look at your repo and code.

### Rubric

Checklist:

1. ```O0_output.txt``` commited to repo (1pt)
2. ```O3_output.txt``` commited to repo (1pt)
3. ```1GHz_output.txt``` commited to repo (1pt)
4. ```2GHz_output.txt``` commited to repo (1pt)
5. ```1k_output.txt``` commited to repo (1pt)
6. ```10k_output.txt``` commited to repo (1pt)
7. ```20k_output.txt``` commited to repo (1pt)
5. Answer question in write up "lab1.pdf" and submit to Gradescope (5 pts)
