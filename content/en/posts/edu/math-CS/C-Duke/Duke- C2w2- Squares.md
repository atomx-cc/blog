---
title: "Squares"
date: 2023-11-24
categories:
  - IT
tags:
  - Internet
  - Math & CS
  - AI
---

Week 2, Squares

[**Assignment 05_squares**](https://www.coursera.org/learn/writing-running-fixing-code/programming/1wa3P/assignment-05-squares/submission)

```c
// template/skeleton with empty implementations 

#include <stdio.h>
#include <stdlib.h>

/*
- Determines if coord is in range between
- offset (INCLUSIVE) and offset + size (EXCLUSIVE)
*/
int isInRange(int coord, int offset, int size) {
// if coord is in range, return 1
// else, return 0
return 0;
}

/*
- Determines if coord is at border of offset or
- offset + size
*/
int isAtBorder(int coord, int offset, int size) {
// if coord is equal to offest or offset + size
// return 1, else return 0
return 0;
}

void squares(int size1, int x_offset, int y_offset, int size2) {
//compute the max of size1 and (x_offset + size2).  Call this w

//compute the max of size1 and (y_offset + size2).  Call this h

//count from 0 to h. Call the number you count with y
//count from 0 to w. Call the number you count with x

  //check if  EITHER
  //    ((x is between x_offset  and x_offset +size2) AND
  //     y is equal to either y_offset OR y_offset + size2 - 1 )
  //  OR
  //    ((y is between y_offset and y_offset + size2) AND
  //     x is equal to either x_offset OR x_offset + size2 -1)
  // if so, print a *

  //if not,
  // check if EITHER
  //    x is less than size1 AND (y is either 0 or size1-1)
  // OR
  //    y is less than size1 AND (x is either 0 or size1-1)
  //if so, print a #

  //else print a space
//when you finish counting x from 0 to w,
//print a newline

}

```

```c
//  complete implementation without comments.
#include <stdio.h>
#include <stdlib.h>

int isInRange(int coord, int offset, int size) {
    if (coord >= offset && coord < offset + size) {
        return 1;
    } else {
        return 0;
    }
}

int isAtBorder(int coord, int offset, int size) {
    if(coord == offset || coord == offset + size) {
        return 1;
    } else {
        return 0;
    }
}

int max(int a, int b) {
    return (a > b) ? a : b;
}

void squares(int size1, int x_offset, int y_offset, int size2) {
    int w = max(size1, x_offset + size2);
    int h = max(size1, y_offset + size2);

    for (int y = 0; y < h; y++) {
        for (int x = 0; x < w; x++) {
            if ((isInRange(x, x_offset, size2) && (y == y_offset || y == y_offset + size2 - 1)) ||
                (isInRange(y, y_offset, size2) && (x == x_offset || x == x_offset + size2 - 1))) {
                printf("*");
            } else if ((x < size1 && (y == 0 || y == size1 - 1)) ||
                       (y < size1 && (x == 0 || x == size1 - 1))) {
                printf("#");
            } else {
                printf(" ");
            }
        }
        printf("\n");
    }
}

int main() {
    squares(5, 2, 3, 4);
    return 0;
}
```

the other way to write code

`if ((isInRange(x, x_offset, size2)`

`if ((x>= x_offset && x< x_offset + siz)`

## test

if we include printf in a curely bracket  `{printf("\n");}`

if we change code as `if ((x> x_offset && x< x_offset + siz)`

then what will happen?