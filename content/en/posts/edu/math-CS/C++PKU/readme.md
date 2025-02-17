---
title: "[程序设计与算法]"
date: 2023-12-01
categories:
  - IT
tags:
  - Internet
  - Math & CS
  - AI
---


北京大学coursera [程序设计与算法](https://www.coursera.org/specializations/biancheng-suanfa) Specialization 专项课程。

练习题[Github 库](https://github.com/Atomx3/Coding-practice/tree/main/C%2B%2BPKU)

参考[GitHub - chiuchiuuu/programming-and-algorithm](https://github.com/chiuchiuuu/programming-and-algorithm)


## 课程名
以文件夹定义

- C1, 计算导论与C语言基础
- C2, C程序设计进阶
- C3, C++程序设计
- C4, 算法基础
- C5, 数据结构基础
- C6, 高级数据结构与算法
- C7, 程序开发项目实践

### 文件名

取名规则：例如 2.3.3.cpp
* 2.C程序设计进阶 (系列课程的第二课)
* 3.函数递归（该课第三周）
* 3.编程题＃4：扩号匹配问题（该周第四题）

不能保证全部代码都通过coursera或[POJ](http://pkuic.openjudge.cn/)的评价



## Debugging case：  
% c++ 3.9.1.cpp  
3.9.1.cpp:83:9: warning: 'auto' type specifier is a C++11 extension [-Wc++11-extensions]  
for(auto p : v) {  
^  
3.9.1.cpp:83:16: warning: range-based for loop is a C++11 extension [-Wc++11-extensions]  
for(auto p : v) {  
^  
2 warnings generated.  


## compile error
有些題目無法通過coursera或 POJ 平台的作業評估，請注意，可能要求做的是填空題，已經提供了大部分代碼，只要求提交一部分代碼，
所以提交文件格式例如 3.9.1.txt，而非 3.9.1.cpp。


## Standard compile in terminal of Macbook pro：  
g++ -std=c++11 -o program 3.9.1.cpp
./program 
