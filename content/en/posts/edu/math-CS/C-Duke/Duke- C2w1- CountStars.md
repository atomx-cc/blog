---
title: "CountStars"
date: 2023-11-21
categories:
  - IT
tags:
  - Internet
  - Math & CS
  - AI
---


Week 1, CountStars


## print stars

[Step 3: Repetitions](https://www.coursera.org/learn/writing-running-fixing-code/supplement/aS4L3/step-3-repetitions)

[Stars Example](https://www.coursera.org/learn/writing-running-fixing-code/supplement/UCjM3/stars-example)


```c
#include <stdio.h>

int printTriangle(int size)
{
//start with starCount being 0
int starCount = 0;
//count from 0 (inclusive) to size (exclusive), for each number i that you count
for (int i=0; i< size; i++)
		{ 
//count from 0 (inclusive) to i (inclusive), for each number j that you count
 for (int j=0; j<=i; j++)
				 {
    //print a "*"
    printf("*");

    //increment starCount
    starCount++;
				  }

 //when you finish counting on j,
 //print a newline ("\\n")
 printf("\\n");
		}
//when you finish counting on i,
//your answer is starCount
return starCount;
}

int main(void)
{
int numStars;
printf("Here is a triangle with height 4\n");
numStars = printTriangle(4);
printf("That triangle had %d total stars\n", numStars);
//now print "Here is a triangle with height 7\n"
//then call printTriangle, passing in 7, and assign the result to numStars
//finally, print "That triangle had %d total stars\n", such that the %d
//prints the value of numStars
return 0;
}
```

Tips:

outer loop `i` , count the `i` -th row;

inner loop `j`, count the `j` -th column, and print a `*` on each column;

function `printTriangle` print * triangle between two print strings in main;

actually, `starCount = numStars`, they count the total stars(on each row and column), can change/unify the name to one, either `starCount` or `numStars` ;

# Why error?

when exchange the position of the `main` box and `printTriangle` box, run the code and show below. 

```c
error: implicit declaration of function 'printTriangle' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
starCount = printTriangle(4);
						^
1 error generated.
make: *** [<builtin>: math2] Error 1
```

The error is due to the compiler not being able to find a declaration for the function `printTriangle` before it’s used. In C, we need to declare functions before we use them. This can be done by providing a function prototype before the function call, or by defining the function entirely. 


that’s why, we usually put main box at the end of program, otherwise, we have to define and declare the function in `<stdio.h>` or so at the beginning.
