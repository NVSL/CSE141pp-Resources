# TODOs

1.  Update links on this page to point to the repos rather than the readmes.
2.  Update links and link text to point to  ML-themed labs
3.  Update course web page.
4.  Need instructions for Windows and the campus docker cluster.
5.  Documentation how to submit via gradescope.

# CSE 141L Reloaded

![Gene Amdahl](images/gene.jpg)

Welcome to CSE 141L Introduction to Computer Architecture Lab.

This repo serves an the homepage for the course labs.  It contains all
the lab write ups and several resources you will use throughout the
course.

Please see the course home page (piazza.com/ucsd/summer2019/cse141lb) for schedule, due dates, and other logistical issues.

## Overview

We are going to optimize code to take advantage of architectural
features of modern microprocessors. Along the way we will learn how to
use several tools that will help.

The goals for the course are for you to learn how to test, profile,
and optimize functions in C code, with a mind towards the pipeline and
cache.

## Labs 

There are 8 labs.  Deadlines are on the course homepage.

The slides for each lab are in the `slides` directory.

Each lab lives in it's own git repo.  Here they are (if the link is dead, that's because the lab hasn't been assigned yet):

0. [Introduction to the Development Environment](https://github.com/NVSL/CSE141pp-Resources/tree/master/labs/Introduction-to-the-Development-Environment/README.md)
1. [Charactering Matrix Multiplication](https://github.com/NVSL/CSE141pp-Resources/tree/master/labs/Characterizing-A-Preceptron/README.md)
2. [Loop Unrolling](https://github.com/NVSL/CSE141pp-Resources/tree/master/labs/Loop-Unrolling/README.md)
3. [Cache Optimization](https://github.com/NVSL/CSE141pp-Resources/blob/master/labs/Cache-Optimization-L1/README.md)
4. [Multicore](https://github.com/NVSL/CSE141pp-Resources/blob/master/labs/Multicore/README.md)
5. [Gotta Go Fast](https://github.com/NVSL/CSE141pp-Resources/tree/master/labs/Make-It-Fast/README.md)

## Using Docker for Local Development

You'll be doing all your development work for the lab inside a docker container.  The container is called

```
stevenjswanson/cse141pp
```

and it's publicly available via docker hub.

### Using Docker on Linux

If you have docker installed on your own machine can you can run

```
bin/cse141L
```

from the root of this repository and it'll start a docker instance
with your home directory mounted on `/home`.


### Under Windows


### On the Campus Docker Cluster

### Doing Something Else

Using other options you may cook up are fine, but they are not
supported.  In fact the only thing that we guarantee will work is the
campus docker cluster.  In particular, the TAs do not have much
bandwidth for helping to get docker working on your laptop.

## Debug Locally, Measure Remotely

Unless you are running on a private machine, running in docker makes
performance unpredictable.  Also, inside docker the performance
counters are not available.

So, in docker, you can compile and test the correctness of your code,
but you can't reliably test its performance.  To do that, you'll need
to submit it via gradescope (see below).

When you submit via gradescope, it uses the same docker container
running in the cloud with some special magic to get access to the
performance counters.  In principle, everything should exactly the
same in the docker container as it will in the cloud.

More detailed instructions are in the first lab.

## Submitting Via Grade Scope

