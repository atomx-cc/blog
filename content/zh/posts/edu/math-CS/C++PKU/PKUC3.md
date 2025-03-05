---
title: "C++程序设计"
date: 2024-03-12
categories:
  - IT
tags:
  - 互联网
  - 数学&计算机
  - AI
---

原课程链接：[C++程序设计](https://www.coursera.org/learn/cpp-chengxu-sheji/)

[cplusplus.com](https://cplusplus.com/)

教材《新标准 c++程序设计》 郭炜, 清华大学

# w11. C++11 新特性

auto 自动变量类型

decltype 关键字，求表达式类型

shared_ptr 智能指针

nullptr 空指针

基于范围的for循环

右值引用和move语义

unordered_map 无序容器(哈希表)

regex 正则表达式

Lambda 表达式

## 强制类型转换

static_cast、interpret_cast
const_cast和dynamic_cast

## C++异常处理基础：try、throw、catch

意外异常(unexpected exception)
动态内存管理的异常处理 new

# w9. STL -

质因数数目

## **container adapter 容器适配器**

(让已有的顺序容器以栈/队列的方式工作)

stack

queue

priority_queue

**member function**

push

top

pop

参考案例：github/ PKUC3/ 3.10.1.4.cpp

### map/ multimap

**`map`** 容器中，关键字key是唯一的，值value可以重复。

**`multimap`** 容器中，关键字和值都可以重复。

### set/ multiset

**`set`** 容器中，元素是唯一的，按其值自动排序，而非插入顺序。

添加新对象时会比较对象的大小，**`set`** 是一个基于红黑树实现的容器，它会自动将元素按照特定的顺序存储，通常是使用元素的 **`<`** 操作符来进行比较和排序。

`set` 容器的迭代器支持双向迭代，可以使用++，- - 移动迭代器，但不支持随机访问，所以不能进行 i+1 的操作；

**`multiset`** 容器中，元素可以重复，并且按其值自动排序。

### vector

**`vector`** 容器支持随机访问，例如 `int i=0, num[i]`；

一个动态数组，可以在尾部快速添加或删除对象，但不会自动排序。

### list

**`list`** 容器是一个双向链表，可在任何位置快速添加或删除对象，不会自动排序；

不支持随机访问，只能通过顺序访问，因此不能使用下标操作符（**`[]`**），小于(**`<`**)操作 或者在迭代器上进行加法操作（**`ii + 1`**）。

只能使用不等于(**`!=`**)操作符来比较迭代器和容器的**`end()`，**以及迭代器的递增操作符（**`++`**），直到达到容器末尾：

```cpp
list <int> v; list <int>::const_iterator ii; 

// 不等于(!=)操作，递增操作（++），正确
for(ii = v.begin(); ii != v.end(); ii++) {
    cout << *ii;
}

// 下标操作（[]），加法操作（ii + 1）， 小于操作(<)，报错
for( ii = v.begin(); ii != v.end ();ii = ii +1 ) 
	  cout << * ii;

for (int i = 0;i < v.size() ; i ++) 
	  cout << v[i]; 

for( ii = v.begin(); ii < v.end ();ii ++ ) 
	  cout << * ii;	
```

### deque

一个双端队列，可以在头部和尾部快速添加或删除对象，但同样不会自动排序。

## The algorithms in STL

• Non-modifying sequence algorithms
• Modifying sequence algorithms
• Removing algorithms
remove, unique, 

• Mutating sequence algorithms
reverse, rotate

• Sorting algorithms

sort, nth_element

• Sorted range algorithms

binary_search, include, lower_bound, upper_bound, equal_range

• Numeric algorithms

# w8. STL - standard template library

标准模板库STL，就是一些常用数据结构和算法的模板的集合。将常用的数据结构（比如链表，数组，二叉树）和算法（比如排序，查找）写成模板。

泛型程序设计(generic programming)

**容器：**可容纳各种数据类型的通用数据结构,是类模板；

1) 顺序容器
vector, deque, list
2) 关联容器
set, multiset, map, multimap
3) 容器适配器
stack, queue, priority_queue

**迭代器：**可用于依次存取容器中元素，类似于指针；

容器上的迭代器类别

- vector 随机访问
deque 随机访问
list 双向
set/multiset 双向
map/multimap 双向
stack 不支持迭代器
queue 不支持迭代器
priority_queue 不支持迭代器

**算法：**用来操作容器中的元素的函数模板；

- sort()来对一个vector中的数据进行排序
- find()来搜索一个list中的对象

## **function object 函数对象**

如果一个类重载了**`()`**运算符，那么该类的对象可以像函数一样被调用，也叫**仿函数**。

```cpp
// 创建一个Adder对象addFive，通过addFive(3)来调用，就像调用普通函数一样

class Adder {
public:
	Adder(int n) : num(n) {} // 构造函数
	int operator()(int x) const {
		return num + x; // 重载()运算符，Adder对象可接受整数参数并返回结果
	}
private:
	int num; // 内部状态
};

int main() {
	Adder addFive(5); // 创建一个函数对象，内部状态为5
	std::cout << addFive(3); // 调用函数对象，输出8
	return 0;
}
```

**C++ 中常用的数据结构**

- **集合（Set）**：Set 是基于二叉搜索树（通常是红黑树）实现的，它的主要优点是查找、插入和删除操作的时间复杂度都是 O(logN)。但是，Set 不支持随机访问，即不能像数组或向量那样通过索引直接访问元素。
- **向量（Vector）**：Vector 是一种动态数组，它的主要优点是支持随机访问，访问元素的时间复杂度是 O(1)。但是，如果在 Vector 的中间位置插入或删除元素，可能需要移动大量的元素，所以这类操作的时间复杂度是 O(N)。
- **列表（List）**：List 是一种双向链表，它的主要优点是在任何位置插入或删除元素的时间复杂度都是 O(1)。但是，List 不支持随机访问，访问元素的时间复杂度是 O(N)。

**O(logN) time.**
• `set` provides fast lookup to check if an id exists in O(logN) time.

Big O notation is a way to express the upper bound of an algorithm’s time complexity, which is a measure of the amount of time an algorithm takes to run as a function of the size of its input.

Big O 表示法是一种表达算法时间复杂度上限的方法，它是算法运行时间的度量，作为其输入大小的函数。

随着元素数量 N 的增加，执行操作所需的时间并不是线性增加（就像在 O(N) 的情况下那样），而是以 N 的对数的比例增长。

假设p1, p2 是STL中的list 容器上的迭代器，**p1 += 1;** 不符合语法？

因为：**`list`** 容器的迭代器是双向迭代器，不支持随机访问和算术操作，因此不能直接使用 **`+=`** 来移动迭代器。

在STL中，**`list`** 容器的迭代器不支持 **`+=`** 操作符

移动迭代器 **`p1`** 到下一个位置，可以使用 **`++p1`** 或者 **`p1++`**

# w7. file operate, template

文件操作、模板

ifstream, ofstream, fstream

cin>> 输入

cout<< 输出

字符流

function template 函数模板

## template class 模板类

common class 普通类

string class 是模板类

typedef basic_string<char> string;

用 **`template<class T>`** 定义一个类时，创建的是一个可以用于多种数据类型的模板，模板类不是一个具体的类实例，这个模板本身不是一个直接可以使用的类，而是一个用于生成特定类型实例的蓝图。

参考程序案例：github/ PKUC3/ 3.10.7.cpp 

## class template 类模板

题目：类C1和类C2都是类模板CT的模板类

- C1的成员函数中，**不能**访问C2的私有成员，除非C2将C1声明为友元。
- C1的友元函数中，**不能**访问C2的私有成员，除非C2将该友元函数声明为友元。
- C1的对象，**不能**直接赋值给C2类型的变量，除非它们是相同的类型或者有适当的类型转换操作定义。
- C1的静态成员变量和C2的静态**成员变量拥有不同的存储空间**。这是因为即使C1和C2是由同一个类模板CT实例化出来的，如果它们的模板参数不同，它们就是不同的类型，每个类型都会有自己的静态成员变量实例。

```cpp
#include <iostream>

// 类模板定义
template <typename T>
class CT {
public:
    // 静态成员变量
    static int staticValue;

    // 构造函数
    CT() {
        // 初始化静态成员变量
        staticValue++;
    }
};

// 静态成员变量的定义和初始化
template <typename T>
int CT<T>::staticValue = 0;

int main() {
    // 实例化一个int类型的CT模板类
    CT<int> intInstance; // 使用类名CT<int>创建对象名为intInstance的对象
    std::cout << "CT<int>::staticValue: " 
    << CT<int>::staticValue << std::endl;

    // 实例化一个double类型的CT模板类
    // 使用类名CT<double>创建对象名为doubleInstance的对象。
    CT<double> doubleInstance;
    std::cout << "CT<double>::staticValue: " 
    << CT<double>::staticValue << std::endl;

    // 再次创建CT<int>的实例
    CT<int> anotherIntInstance;
    std::cout << "CT<int>::staticValue: " 
    << CT<int>::staticValue << std::endl;

    // 输出结果将显示CT<int>和CT<double>的staticValue是独立存储的
    return 0;
}
// 两个实例intInstance和doubleInstance分别属于两个不同的模板类
// 它们是由同一个类模板（类名）CT通过提供不同的类型参数生成的。
```

**operator运算符:** 

- 算术运算符：**`+`**、**``**、**``**、**`/`** 等。
- 比较运算符：**`==`**、**`!=`**、**`<`**、**`>`** 等。
- 逻辑运算符：**`&&`**、**`||`**、**`!`** 等。
- 位运算符：**`&`**、**`|`**、**`^`** 等。

**stream manipulator 流操纵符:** 

`cin , cout`(与`<<, >>` 运算符一起使用)、**`setw`**、**`setfill`**、**`setprecision`**、**`endl`**、**`ws`**、**`ends`**、**`flush`** 

老版本的北大教材中使用“流操纵算子”的术语，在此统一翻译为“**stream manipulator流操纵符**”。

算子（数学概念）与计算机程序中的operator有相通之处，在最新版本的c++库说明文件中，“运算符”替代“算子”的术语。（此处术语有待勘误）

科学计数法（**科学记号**）是一种用于表示非常大或非常小数值的方法，形式：

[ \text{数} = a \times 10^n ]

(2.7 \times 10^3) =  2700

(-5.3 \times 10^4) = -53000

(7.823E5) = 782300

(1.2e^{-4}) = 0.00012

`dec, hex, oct` format flag  for output streams.

`int` represents an integer value in **decimal** (base 10) format. 

# **w6. polymorphism, virtual function**

多态, 虚函数

**abstract class 抽象类**

包含至少一个纯虚函数（pure virtual function）的类

Abstract classes are used to represent general concepts (for example, `Shape`, `Animal`), which can serve as base classes for more specific concrete classes (for example, `Circle`, `Dog`).

- These general concepts often have common properties or behaviors that apply to their derived classes.
- Abstract classes cannot be instantiated directly; they serve as blueprints for other classes.

```cpp
class Base {// Abstract classes 
public: // contain at least one pure virtual function
virtual void func() { cout << "I am in base" << endl; }
};
// **override identifier 标识符**
class Derived : public Base { // override identifier specifies member 
public: // function overrides virtual function in a base class
void func() override { cout << "I am in derived class" << endl; }
};
```

pure virtual function 纯虚函数 

virtual destructor 虚析构函数

若基类的成员函数被声明为虚函数（使用**`virtual`**关键字），那么在派生类中即使不再显式地使用**`virtual`**关键字，该成员函数仍然是虚函数。派生类会继承基类的虚函数属性，并且可以通过多态性来覆盖这些虚函数。

override in derived class 從派生類重寫

If a derived class overrides a base class method, that method becomes virtual implicitly in the base class. 如果派生类重写基类方法，则该方法在基类中隐式变为虚拟方法。

```cpp
// 参考程序案例：github/ PKUC3/ 3.10.1.1.cpp 
// 程序示例，展示虚函数表、虚函数、纯虚函数和抽象类的用法 

#include <iostream>

// 抽象类
class Shape {
public:
    // 纯虚函数，用于计算面积
    virtual double area() const = 0;

    // 虚析构函数
    virtual ~Shape() {}
};

// 派生类：圆形
class Circle : public Shape {
private:
    double radius;

public:
    Circle(double r) : radius(r) {}

    // 重写纯虚函数，计算圆形的面积
    double area() const override {
        return 3.14159 * radius * radius;
    }
};

// 派生类：矩形
class Rectangle : public Shape {
private:
    double width, height;

public:
    Rectangle(double w, double h) : width(w), height(h) {}

    // 重写纯虚函数，计算矩形的面积
    double area() const override {
        return width * height;
    }
};

int main() {
    // 不能直接创建抽象类的实例
    // Shape shape; // 错误：不能实例化抽象类

    // 创建派生类的实例
    Circle circle(5);
    Rectangle rectangle(4, 6);

    // 使用指向基类的指针数组来调用派生类的函数
    Shape* shapes[2] = {&circle, &rectangle};

    // 通过基类指针调用重写的函数
    for (int i = 0; i < 2; ++i) {
        std::cout << "Shape " << i + 1 << " area: " << shapes[i]->area() << std::endl;
    }

    return 0;
}

```

## **对象赋值**

如果类C2是类C1的派生类，那么可以将C2的对象赋值给C1类型的变量。多态特性，允许派生类对象被视为基类对象，通过指针或引用来实现的。

```cpp
class C1 {
// 基类成员
};

class C2 : public C1 {
// 派生类成员
};

int main() {
C2 objC2;
C1* ptrC1 = &objC2; // C2的对象可以赋值给C1类型的指针
C1& refC1 = objC2;  // C2的对象也可以赋值给C1类型的引用
return 0;
}
```

# w4. operator overloading

运算符重载 

流插入运算符和流提取运算符的重载

cout<<左移，cin>>右移，位运算符

### complex number 复数类

用于表示和操作复数的编程类

`a + bi`  

（a）是实数部分，( b ) 是虚数部分，而 ( i ) 是虚数单位，满足 ( i^2 = -1 )。

普通函数，传入2个参数

成员函数，传入1个

## operator[ ]

**index operator,** **subscript operator overloading**

下标运算符重载

## operator=

assignment operator overloading

赋值运算符重载

```cpp
class String{
	private:
		char *str;
	public:
		String():str(NULL){} // 构造函数，初始化为NULL
		const char *c_str(){ return str; }
		char *operator = (const char *s);
		~String();
}; 

//重载‘=’→ object = "hello" 能够成立 
char *String::operator = (const char *s){
	if(str == s.str){ return *this; }
	if(str){
		delete[] str; }
	if(s){ // s！= NULL 时才执行copy
		str = new char[strlen(s) + 1];
		strcpy(str,s); }
	else{
		str = NULL; }
	return str;	
	}
	
	String::~String()
	{
		if(str){
			delete []str; }
}
	
	int main(){
		String s;
		s = "Good Luck,";
		cout<<s.c_str()<<endl;
		//String s2 = "hello!" ; // error，因为这不能为初始化语句，而是赋值
		s = "Atom!";
		cout<<s.c_str()<<endl;
		return 0;
	}
	
	// output
	Good Luck, 
	Atom!
```

```cpp
//实现深复制，规避浅复制

String::String(String &s)
{
	if(s){ 
		str = new char[strlen(s) + 1];
		strcpy(str,s); 
	}
	else{
		str = NULL; 
	}
}
```

## operator + overloaded as friend function.

common function can not access private member

普通函数不能访问私有成员

运算符+重载为友元函数

```cpp
class Complex{
	double real, immage;
public: 
	Complex(double r, doulbe i): real(r), image(i){};
	Complex operator+(double r);
	friend Complex operator+(double r, const Complex & c);
};
Complex Complex::operator+(double r){ // 能解释 c + 5；
	return Complex(real + r, image);
}
int main(){
	Complex c;
	c = c + 5; //有定义，c = c.operator + (5);
	c = 5 + c; // compiler error 
	// 为了使 c = 5 + c;表达式成立，需要将+重载为普通函数，如下
	Complex operator+(double r, const Complex &c){
	// 能解释 5 + c；
		return Complex(c.real + r, c.image);
	}
	return 0;
}
```

# w3. Class, Object

类, 对象

## constructor 构造函数

- [构造函数**不能**是虚函数。虽然在技术上可以声明虚构造函数，但这通常被认为是危险的，因为在构造函数中调用虚函数不会调用派生类中的重写版本](https://www.geeksforgeeks.org/calling-virtual-methods-in-constructordestructor-in-cpp/)。
- [构造函数中**可以**调用本类的静态成员函数。静态成员函数不依赖于类的实例，因此可以在构造函数中被调用](https://stackoverflow.com/questions/5855046/can-constructor-be-called-from-static-functions)。
- [使用 **`new`** 运算符动态创建对象时，并不一定要使用无参数的构造函数。如果类中定义了带参数的构造函数，也可以使用这些构造函数来初始化对象](https://stackoverflow.com/questions/29329212/new-operator-default-constructor-in-c)。
- 构造函数可以重载，有不同版本的构造函数，例如无参数（默认构造）、带参数、
- [通过赋值号 “=” 对一个对象进行赋值时，**不会**引发复制构造函数的调用。这会调用赋值运算符，而不是复制构造函数](https://www.geeksforgeeks.org/copy-constructor-vs-assignment-operator-in-c/)。

```cpp
#include <iostream>

class MyClass {
public:
// 静态成员函数
static void staticFunc() {
std::cout << "静态成员函数被调用" << std::endl;
}
// 构造函数
MyClass(int val) {
    std::cout << "带参数的构造函数被调用" << std::endl;
    // 调用静态成员函数
    staticFunc();
}

// 复制构造函数
MyClass(const MyClass& other) {
    std::cout << "复制构造函数被调用" << std::endl;
}

// 赋值运算符
MyClass& operator=(const MyClass& other) {
    std::cout << "赋值运算符被调用" << std::endl;
    return *this;
}

// 析构函数
~MyClass() {
    std::cout << "析构函数被调用" << std::endl;
}
};

int main() {
// 使用带参数的构造函数创建对象
MyClass obj1(10);
// 使用复制构造函数创建对象
MyClass obj2 = obj1;

// 赋值运算符的调用
MyClass obj3;
obj3 = obj1;

// 动态创建对象，使用带参数的构造函数
MyClass* obj4 = new MyClass(20);
delete obj4;

return 0;
}
```

**copy constructor vs. assignment operator**

**复制构造函数**用于初始化新创建的对象；

而**赋值运算符**用于已存在对象的赋值操作。

**Inline Member Function, Overloaded Member Function, Default Argument**

内联成员函数，重载成员函数，参数缺省

inline

## copy constructor

```cpp
// 下面的程序不会调用A的复制构造函数
// 因为 a1 = a2 是赋值操作，而不是复制构造
A a1,a2; a1 = a2;

// 传递一个A类型的对象时，调用了复制构造函数
void func( A a) { cout << "good" << endl; } 
// 返回局部对象tmp时，会调用复制构造函数
A func( ) { A tmp; return tmp; }
// 通过已存在的对象a1来初始化a2，调用复制构造函数
A a1; A a2(a1);
```

## Conversion Constructor, Destructor

类型转换构造函数、析构函数

it change right side int 6 to left side temporary Demo class, and assign the value 6 to d1.

constructed and destructed order.

```cpp
Class Demo{
	int id;
public:
	Demo(int i){ // Constructor
		id = i;
		cout<<"id="<<id<<"constructed"<<endl;
	}
	~Demo(){
		cout<<"id="<<id<<"destructed"<<endl;
	}
};
Demo d1(1); // global variable firstly
void Func(){
	static Demo d2(2); // static varible destructed at the end of whole program.
	Demo d3(3); // object must be destructed within Scope.
	cout<<"Func"<<endl;
}
 
int main(){
	Demo d4(4);
	d4 = 6; // Conversion Constructor temporary
	cout<<"main"<<endl;
	{ Demo d5(5); } // object must be destructed within Scope.
	Fun();
	cout<<"main"<<endl;
	return 0;
}

//output
id=1 constructed;
id=4 constructed;
id=6 constructed;
id=6 destructed;
main
id=5 constructed;
id=5 destructed;
id=2 constructed;
id=3 constructed;
Fun
id=3 destructed;
main ends
id=6 destructed;
id=2 destructed;
id=1 destructed;
```

## static member variable, static member function

静态成员变量、静态成员函数

static

类的非静态成员函数完全可以访问静态成员变量。

静态成员变量不属于类的任何单个对象，而是由类的所有对象共享。

静态成员函数可以访问类的静态成员变量，但不能访问非静态成员变量，包括常量和非常量成员，因为静态成员函数不依赖于类的任何特定对象。

不需要创建类的对象，就可以访问类的静态成员。

## friend 友元

类C2是类C1的派生类，若函数f是C1的友元，它并不自动成为类C2的友元。友元关系是显式指定的，只适用于被明确声明的类。友元关系不会被继承。

友元函数可以访问其友元类中的私有和保护成员，但这种访问权限不会传递给派生类。如果你希望函数f也成为类C2的友元，你需要在类C2中显式地声明f为友元：

```cpp
class C1 {
    friend void f(); // f是C1的友元
};

class C2 : public C1 {
    friend void f(); // f也需要在C2中声明为友元
};
```

## const object, const member function, const reference.

常量对象、常量成员函数、常引用

参考案例：`github/ PKUC3/ 3.10.1.2.cpp`

常量成员函数可以被任何对象调用，但它们不能修改对象的状态。常量对象只能调用常量成员函数。

## this index, this 指针

**`this`** 指针是一个特殊的指针，它指向当前对象的实例。

const成员函数中、在虚函数中可以使用this指针。

- **类的静态成员函数中，不能访问this指针**。这是因为静态成员函数是属于类的，而不是某个特定对象的。因此，它们没有this指针，这个指针在非静态成员函数中用于指向调用函数的对象。
- **类的友元函数实际上不是类的成员函数，所以它们本身就没有this指针**。但如果它们接受一个对象作为参数，它们可以访问该对象的非静态成员。
- **类的构造函数中可以访问this指针**，因为构造函数是在对象创建时调用的，所以它们有一个指向新创建对象的this指针。
- **类的虚函数中也可以访问this指针**，因为虚函数是与对象的动态类型相关联的，所以它们可以通过this指针访问调用它们的对象。

# **w2. from c to c++**

参考程序案例：github/ PKUC3/ 3.10.8.cpp 

**Bitwise operations**

位运算

**&**

- 0 & 0 = 0
- 0 & 1 = 0
- 1 & 0 = 0
- 1 & 1 = 1

**|**

- 0 | 0 = 0
- 0 | 1 = 1
- 1 | 0 = 1
- 1 | 1 = 1

**^**

- 0 ^ 0 = 0
- 0 ^ 1 = 1
- 1 ^ 0 = 1
- 1 ^ 1 = 0

 **~** 

- ~1 = 0
- ~0 = 1
