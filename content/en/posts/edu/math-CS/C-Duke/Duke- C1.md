---
title: "Programming Fundamentals"
date: 2023-11-12
categories:
  - IT
tags:
  - Internet
  - Math & CS
  - AI
---


Original Course link: [Programming Fundamentals](https://www.coursera.org/learn/programming-fundamentals)


# Week 2

[lvalue, rvalue](https://www.geeksforgeeks.org/lvalue-and-rvalue-in-c-language/)

eg.  int x = 3;

lvalue is x, rvalue is 3

erroneous code 

**for loop** = syntactic sugar, it allows you to write more compact code for counting, a common programming idiom(behavior, custom).  

## What does **f(5)** evaluate to?

```c
int f (int n) {
  int ans = 0;
  for (int i = 1; i < n; i++) {
    if (i < n/2) {
      ans -= i;
    }
    else {
      ans += i;
    }
  }
  return ans;
}
```

Hint: dividing integers results in an integer answer. eg. 9/4 = 2, 5/2=2 (四舍五入rounding 3 is wrong)

## **Conditional Statements**

for switch, if we execute case 3, then do we have to execute default case? because there is no break after case 3?

```c
int g (int x, int y) 
{
  switch(x - y) {
	case 0:
		y += x ;
		break
	case 3:
		y = x + 9;
	default:
		return y - x;
  }
return y;
}
```

No, we jump out of the switch execution curly brace to next step return y. default is only for the no-matching case condition. 

## What is the output for **f(-1, 4)**?

```c
void f (int x, int y) {
  while (x < y) {
    printf("%d ", y - x);
    x = x + 1;
    y = y - 1;
  }
}
```

| y-x  | 5 | 3 | 1 |
| --- | --- | --- | --- |
| x | 0 | 1 | 2 |
| y | 3 | 2 | 1 |

**answer 5 3 1**

print out 3 times result on the screen.

# Week 1

## Quiz - algorithm practice

1. set first number in the sequence is x, the quantity of numbers of each sequence is y.

x = N*3

y = (N+1)*2

sequence = {x+2*0, x+2*1, x+2*2 …… x+2*(y-1)}

Set N=3

x = 9

y = 8

sequence = {9 11 13 15 17 19 21 23}

1. Count the width and height of the pattern as 

N (x, y)

0 (1, 2)  2 (3, 4)  4 (5, 6)  6 (?, ?)

1 (2, 3)  3 (4, 5)  5(6, 7)

by induction, we get 6 (7, 8) , means 7 red square in width, and 8 red square in height.

the pattern should be one blue square on the top right.

1. compare the sequence below

each sequence has the rules to grow the number by even, and the quantity of numbers are also regularly.

N {???}

2 {0 2, 2 3}

3 {0 2 4, 3 4 5}

4 {0 2 4 6, 4 5 6 7}

5 {0 2 4 6 8, 5 6 7 8 9}
6 {0 2 4 6 8 10,  6 7 8 9 10 11}

 

## Graded quiz - algorithms

1. set N {R(x,y), B(x,y), G(x,y)} 

0  R (0,0)

| **N** | **Quantity\ R(x,y)** | **Quantity\ B(x,y)** |  **Quantity\ G(x,y)** |
| --- | --- | --- | --- |
| **0** | 1\ (0,0) | 1\ (0,1) | 1\ (1,0) |
| **1** | 2\ (0,1) (1,0) | **1\ (1,1)** | **2\ (0,2) (2,0)** |
| **2** | 3\ (0,2) (1,1) (2,0) | 2\ (0,3) (2,1) | 2\ (1,2) (3,0) |
| **3** | 4\ (0,3) (1,2) (2,1) (3,0)  | **2\ (1,3) (3,1)** | **3\ (0,4) (2,2) (4,0)** |
| **4** | 5\ (0,4) (1,3) (2,2) (3,1) (4,0) | 3\ (0,5) (2,3) (4,1) | 3\ (1,4) (3,2) (5,0) |
| **5** | 6\ (0,5) (1,4) (2,3) (3,2) (4,1) (5,0) | **3\ (1,5) (3,3) (5,1)** | **4\ (0,6) (2,4) (4,2) (6,0)** |
| **6 ?** | 7\ (0,6) (1,5) (2,4) (3,3) (4,2) (5,1) (6,0) | 4\ (0,7) (2,5) (4,3) (6,1) | 4\ (1,6) (3,4) (5,2) (7,0) |

**R(x,y)** x starts from 0, y end in 0;

**B(x,y)** x starts from 0/1, y is equal between two lines (when N=0&1, 2&3, 4&5); the blue color line show symmetrical in the sequence such as N=3 {(1,3) (3,1)}

**G(x,y)** the similar rules as B(x,y).

1. algorithm for the pattern squares

set N= 5, (5,0)

|  |  |  |  |  |  |  |
| --- | --- | --- | --- | --- | --- | --- |
|  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |
|  |  |  |  | rrrrr |  |  |
|  |  |  | rrrr | rrrrr | ggg |  |

r (5,0)

b(even,0)

g(odd,0)

1. sequence rules

| N | Quntity\ -0 | Quntity\ +0 |
| --- | --- | --- |
| 1 |  | 1\ +3 |
| 2 | 2\ -1, 3 | 3\ 5, +7, 9  |
| 3 | 3\ -1, 3, 5 | 5\ 7, +9, 11, 13 …… |
| 5 | 5\ -1, 3, 5, 7, 9 | 9\ 11, +13, 15, 17 …… |
| 6 | 6\ -1, 3, 5, 7, 9, 11 | 11\ 13, +15, 17, 19 …… |

**Quntity\ -0**

first number of the -0 part sequence come from the first number of the last line of +0;

**Quntity\ +0**

first number starts from 1, 3, 5, odd integer.

then add the before number in each sequence.

**when N= 6**

0 13 28 45 64 85 108 133 160 189 220 253  (totally 11 numbers after 0)

( +13, 15, 17, 19, 21, 23, 25, 27, 29, 31, 33 add this sequence one after another from the left side, to get the above sequence )

-36 -35 -32 -27 -20 -11 0 (totally 6 numbers before 0)

(-1, 3, 5, 7, 9, 11 add this sequence one after another from right side, to get the above sequence )

**-36 -35 -32 -27 -20 -11 0 13 28 45 64 85 108 133 160 189 220 253**

1. algorithms for the above sequence

x=-N*N, i [1, 3N)

set N=2, sequence is 

| 2 | -4 -3 0 5 12 21 |
| --- | --- |

write down x, x= x+2i -1 

x= -4, 

i [1, 6)

count i from 0,  x sequence is 

x, -4

1, -3

2, 0

3, 5

4, 12

5, 21

set N=1, sequence is 

| 1 | -1 0 3 |
| --- | --- |

x=-1,

i[1,3)

count i, x sequence is 

x, -1

1, 0

2, 3

**Hi Dear mentor and professor,**

I past all other quiz and assignemnt, excep the last one.

Give an example):

N    output

0 ,

1 , -1 0 3

2 , -4 -3 0 5 12 21

3 , -9 -8 -5 0 7 16 27 40 55

is the following a correct algorithm for the above numerical sequence?

Given a non-negative integer N:

Make a variable called x, and set it to -N*N.

Count from 1 to 3N + 1 (exclusive), and for each number

that you count (call it 'i'):

Write down the value of x.

Update x to be (x + 2i).

I don't understand the meaning of the text above:

does x = -N*N = - N2  ?  set N=2, so x= -4 ?

Becasue 3N=1 exclusive in counting i range (1,6), so we can not count 7?

then sequence i = {1, 2, 3, 4, 5, 6}, so sequence 2i {21, 22, 23, 24, 25, 26} ?

Update x to be (x + 2i), so x = -4 + 2i ?

so sequence x = {17, 18, 19, 20, 21, 22 } ?

the result is totally wrong, but I don't know what's wrong with it?

please give some hint for which courses in week 1 are related to this quiz? I will review and try to understand the quiz text.

Looking forward to hearing from you.

Best regards !

Atom

Next day: I past the quiz 100% and solve the above doubt finally after a night sleep.

the correct algorithm for the N sequqence is:

**x= x+2i -1**

**count i from [1, 3N)**

I still don't understand what's the meaning of 3N+1 exclusive, actually the i range only [1, 3N-1], so I notice it as [1, 3N) exclusive 3N, but why there says 3N+1 exclusive?

btw, we must unify the expression and identifier, if we write multiply as **x = -N*N**, then **2i** shoud be changed as **2* i** .

I also misunderstand **update x** meaning, so that **x= x+2i -1** when **count i,** actually it is easy to get the meaning, but i forgot it yesterday that I made a mistake .