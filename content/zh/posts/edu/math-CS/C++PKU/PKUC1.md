---
title: "计算导论与C语言基础"
date: 2023-12-13
categories:
  - IT
tags:
  - 互联网
  - 数学&计算机
  - AI
---

原课程链接：[计算导论与C语言基础](https://www.coursera.org/learn/jisuanji-biancheng/)


## Turing machine

The ranking is in descending order of price and working speed

- Register: carries operation data and results, as fast as a CPU
- Cache: data buffer
- Memory: the part that cannot be placed in the CPU
- External memory (hard disk, USB flash drive)

> C. Bohm & G. Jacopini, "Flow Diagrams, Turing Machines and Languages ​​with Only Two Formations Rules", Communications of ACM, vol9(5) May 1966, pp 366-371.
>

Everything in the world is complicated, and there are only three kinds of logic expressed in programs:

- Sequence: the order of statements;
- Loop: for, while;
- Branch: if, else;

## **Knowledge structure of C-based languages:**

More than 30 keywords

More than 10 basic data types;

More than 30 basic operation symbols;

3 basic logic statements;

1.5 [Structured Programming Case](https://www.coursera.org/learn/jisuanji-biancheng/lecture/UhSY9/ti-yan-jie-gou-hua-de-cheng-xu-shi-li)

## **Data type change during the calculation.**

char, short → int

int → unsigned → long → double

float → double

all will be changed to double if there is a double type data in the expression.

++i, before use i, must +1;

i++, after use i, must +1;

it could be used for variables but not expression such as below

`errors: (-i)++, ++i++` 

-i, ++i, i++ all are an expressions, they could not be used for increment operation ++ or - - again.

[more complicated increment operation](https://www.coursera.org/learn/jisuanji-biancheng/lecture/39QkH/zi-zeng-zi-jian-yun-suan) 

when debugging , you will find the order of operations on breakpoint step by step in specific compiler.

[Priority of mixed operations](https://www.coursera.org/learn/jisuanji-biancheng/lecture/dIKXB/luo-ji-yun-suan-yu-hun-he-yun-suan)


Logical NOT (!) **>** Arithmetic operation **>** Relational operation **>** “&&” and “｜｜” **>** Assignment operation

逻辑非(!)  **>**  算术运算  **>** 关系运算  **>**  “&&”和“｜｜”  **>**  赋值运算


BITwise operators 按位运算符

# C++ symbols

**IO Manipulators**

[cplusplus.com/reference/iomanip/](https://cplusplus.com/reference/iomanip/)



