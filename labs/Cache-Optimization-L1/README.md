# Cache Optimization (L1)

# Loop Blocking

In this lab, you will manually block code loops to increase performance.

This lab will be done in pairs.

Check the course schedule for due date(s).

Skills to Learn

1. Manually block loops to increase performance
2. Identify which loops may benefit from blocking
3. Manually block loops to complement compiler optimizations


## Software You Will Need

1. A computer with Docker installed (either the basement CSE labs or your own laptop).
2. The [starter repo] for this lab. (Don't clone it until the start of class, last-minute changes are likely.)
3. The contents of the class materials Github repo: https://github.com/NVSL/CSE141pp_Resources

## Tasks to Perform

### Test Locally

Test the starter code locally. Notice that the `-O3` optimizations are used during compilation. You will need to do better than the compiler to complete the lab.

### Inspect `submission/code.c`

You will be modifying the function `sqmm()` in `submission/code.c`.

You will need to perform the same calculation in `sqmm()`, but you will change the control and operations to improve execution time.

The results of floating-point math can change with the order that operations are applied. Don't worry about these small discrepancies. Optionally see `main.cpp` to see how this is accounted for.

__IMPORTANT__ The calculations performed in `sqmm()` have changed since the last lab. The calculation now adds the result to the destination array instead of overwriting it.

### Start Blocking!

Read through the lab write-up. You will need to do some specific type of blocking to complete it.

For each type of blocking follow these steps: 
1. Modify `sqmm()`
2. Test locally. Your code should pass the tests in `main.cpp` and complete in less than a minute.
3. If your code works locally, submit on Gradescope.
4. Save the output of `submission/code-stats.csv` with a reasonable name and push to your repo. This is your data for the write-up.

### Make it Fast

Questions 1, 2, and 3  of the write-up ask for specific types of blocking. Questions 4 and 5 ask for your fastest solution.
You should try to make `sqmm()` as fast as possible using blocking. You may also using blocking combined with manual loop unrolling.

You must beat Devon and Justin's submissions on the Gradescope leader board in __L1 Cache Misses__ for full credit. Your final submission to Gradescope should be your code that has the lowest __L1 Cache Misses__.

__IMPORTANT:__ There is some small variance between runs on the autograder. Do not submit the same code over and over hoping for a slightly better time, _especially close to the due date_. Doing this can prevent other students from completing the lab and is considered abusing the lab resources.

## Turn in Your Work
The write-up pdf will be submitted through Gradescope.

Also, create a GitHub Tag for your repository once you’ve done the final commits. 
Enter this detail in the submission under “Tag”.
We will look at your repo and code.

### Rubric

Checklist:

1. Submit completed write-up on Gradescope (15pts)
2. Beat Devon's submission on the Gradescope leaderboard (1pt)
3. Beat Justin's submission on the Gradescope leaderboard (1pt)



