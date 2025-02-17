---
title: "PKUC1-w10-array"
date: 2023-12-13
categories:
  - IT
tags:
  - Internet
  - Math & CS
  - AI
---


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

char, short [**→](https://www.bing.com/ck/a?!&&p=fd5e590412ad8ce6JmltdHM9MTcwMzIwMzIwMCZpZ3VpZD0xZmJiNTk2MS0wODJkLTY3ZTItMTJhNS00YmI5MDk0MDY2NzQmaW5zaWQ9NTIzMw&ptn=3&ver=2&hsh=3&fclid=1fbb5961-082d-67e2-12a5-4bb909406674&psq=%e5%90%91%e5%8f%b3%e7%ae%ad%e5%a4%b4&u=a1aHR0cHM6Ly9iYWlrZS5iYWlkdS5jb20vaXRlbS8lRTIlODYlOTIvNzg0NjQ3MQ&ntb=1)** int

int [→](https://www.bing.com/ck/a?!&&p=fd5e590412ad8ce6JmltdHM9MTcwMzIwMzIwMCZpZ3VpZD0xZmJiNTk2MS0wODJkLTY3ZTItMTJhNS00YmI5MDk0MDY2NzQmaW5zaWQ9NTIzMw&ptn=3&ver=2&hsh=3&fclid=1fbb5961-082d-67e2-12a5-4bb909406674&psq=%e5%90%91%e5%8f%b3%e7%ae%ad%e5%a4%b4&u=a1aHR0cHM6Ly9iYWlrZS5iYWlkdS5jb20vaXRlbS8lRTIlODYlOTIvNzg0NjQ3MQ&ntb=1) unsigned [→](https://www.bing.com/ck/a?!&&p=fd5e590412ad8ce6JmltdHM9MTcwMzIwMzIwMCZpZ3VpZD0xZmJiNTk2MS0wODJkLTY3ZTItMTJhNS00YmI5MDk0MDY2NzQmaW5zaWQ9NTIzMw&ptn=3&ver=2&hsh=3&fclid=1fbb5961-082d-67e2-12a5-4bb909406674&psq=%e5%90%91%e5%8f%b3%e7%ae%ad%e5%a4%b4&u=a1aHR0cHM6Ly9iYWlrZS5iYWlkdS5jb20vaXRlbS8lRTIlODYlOTIvNzg0NjQ3MQ&ntb=1) long [→](https://www.bing.com/ck/a?!&&p=fd5e590412ad8ce6JmltdHM9MTcwMzIwMzIwMCZpZ3VpZD0xZmJiNTk2MS0wODJkLTY3ZTItMTJhNS00YmI5MDk0MDY2NzQmaW5zaWQ9NTIzMw&ptn=3&ver=2&hsh=3&fclid=1fbb5961-082d-67e2-12a5-4bb909406674&psq=%e5%90%91%e5%8f%b3%e7%ae%ad%e5%a4%b4&u=a1aHR0cHM6Ly9iYWlrZS5iYWlkdS5jb20vaXRlbS8lRTIlODYlOTIvNzg0NjQ3MQ&ntb=1) double

float [→](https://www.bing.com/ck/a?!&&p=fd5e590412ad8ce6JmltdHM9MTcwMzIwMzIwMCZpZ3VpZD0xZmJiNTk2MS0wODJkLTY3ZTItMTJhNS00YmI5MDk0MDY2NzQmaW5zaWQ9NTIzMw&ptn=3&ver=2&hsh=3&fclid=1fbb5961-082d-67e2-12a5-4bb909406674&psq=%e5%90%91%e5%8f%b3%e7%ae%ad%e5%a4%b4&u=a1aHR0cHM6Ly9iYWlrZS5iYWlkdS5jb20vaXRlbS8lRTIlODYlOTIvNzg0NjQ3MQ&ntb=1) double

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



