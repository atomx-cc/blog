# PKUC1

Date: December 13, 2023

[GitHub - chiuchiuuu/programming-and-algorithm: 北京大学coursera「程序设计与算法」专项课程](https://github.com/chiuchiuuu/programming-and-algorithm)

Turing machine

1. 寄存器：带操作数据和结果，速度与cup一样快

  1.1 高速缓存：数据缓冲区

1. 内存：cpu里放不下的部分
2. 外存（硬盘、U盘）
价格和工作速度递减，按以上排名

> C. Bohm & G. Jacopini, “Flow Diagrams, Turing Machines and Languages with Only Two Formations Rules”, Communications of ACM, vol9(5) May 1966, pp 366-371.
> 

世界上万事万物纷繁复杂，用程序表达只有3种逻辑：
顺序: 语句的先后秩序；

循环: for, while ；

分支：if, else ；

**C系语言的知识结构：**

30 多个关键字

10 多种基本数据类型；

30 多个基本运算符号；

3 种基本逻辑语句；

1.5 [结构化程序编写案例](https://www.coursera.org/learn/jisuanji-biancheng/lecture/UhSY9/ti-yan-jie-gou-hua-de-cheng-xu-shi-li)

**Data type change during the calculation.**

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

[混合运算的优先级](https://www.coursera.org/learn/jisuanji-biancheng/lecture/dIKXB/luo-ji-yun-suan-yu-hun-he-yun-suan)

逻辑非(!)  **>**  算术运算  **>** 关系运算  **>**  “&&”和“｜｜”  **>**  赋值运算

logic operation **>** Arithmetic operations **>** Relational operations **>** “&&” and “||” **>** Assignment operations

BITwise operators 按位运算符

# C++ symbols

**IO Manipulators**

[cplusplus.com/reference/iomanip/](https://cplusplus.com/reference/iomanip/)

