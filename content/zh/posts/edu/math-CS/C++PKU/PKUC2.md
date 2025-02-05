# PKUC2

Date: December 14, 2023

# const vs. static

const 限制指针实参的功能

**指针常量**：

- 不能修改指针所指向的地址。在定义时必须立即初始化。
- 示例：
    
    ```cpp
    char* const ptr = &some_char; // ptr 是一个指向 char 的常量指针
    *ptr = 'a'; // 合法，修改了 ptr 所指向的 char 的值
    ptr = &another_char; // 错误，不能修改 ptr 的值
    ```
    

**常量指针：**

- 不能修改指针所指向地址的内容，但可以改变指针所指向的地址。
- 示例：
    
    ```cpp
    const char* ptr; // ptr 是一个指向 char 的常量指针
    char const* ptr; // 与上一行等效
    *ptr = 'a'; // 错误，不能修改 ptr 所指向的 char 的值
    ptr = &another_char; // 合法，可以改变 ptr 的值
    ```
    

static 在函数内部或类中声明的静态变量，其生命周期跨越整个程序执行过程（在循环中多次执行，每次循环的初始值继承了上一次循环的值），且只初始化一次。

# string literal

```cpp
#include <iostream>
using namespace std;

int main()
{
    // input arguments
    int k=0, m=0, n=0;
    cin>>k;
    cin>>m>>" ">>n; // wrong expression.
}
```

**`cin`** operator automatically skips any whitespace, including spaces and newlines. it’s illegal to use “ ” with cin, because it is string literal, cin could not hold string.

**`getline(cin, line);`**where **`line`** is a **`string`**. This will read an entire line of input, including spaces, until it encounters a newline

`cin.getline(str, 101)`;

# return, break, exit

```cpp
/* eg: 2.3.4.cpp
2. C程序设计进阶
3. 第三周
3. 编程题＃4：扩号匹配问题
// Recursively find the next pair

void find_pair(char *str){
    int i = 0;
    remove(str);
    char  boy= '(', girl= ')';
    while(str[i] != '\0'){
        if(str[i] == boy){
            int j = i + 1;
            while(str[j] != '\0') { 
                if(str[j] == girl){
                str[i]=' ';
                str[j]=' ';
                find_pair(str); 
                return ;
                }
                // If we find another boy before a girl, break, i++     
                if(str[j] == boy) break; 
                j++;
            }    
        }
        i++;
    }
}
```

**`return`**: In a function, it ends the execution of the function, and returns control to the calling function. It can also return a value to the caller, which can be used in the expression.

**`break`**: it is used to terminate the loop or switch statement and transfer execution to the statement immediately following the loop or switch. It doesn’t end the execution of the function.

**`exit`**: it terminates the entire program, not just the current function. It’s usually used to end the program immediately in response to some error condition.

# Pointers

## Array address and pointers

6.2.5 Type
6.3.2.1 Lvalues, array and function designators.
6.5.2.1 Array subscripting

array name represents the address of the first element in array. 
or array name is the pointer that point to the first element of the array. 

```c
// example

int main()
{
	a[5]={10,2,3,4,5};
	cout<< a <<endl;
	cout<< a[0] <<endl;
	cout<< &a[0] <<endl;
	cout<< a* <<endl; 
}

// output
0017F754
10
0017F754
10

a = &a[0]
a[0] = a*
```

指针，计算顺序，因为指针和 -- 运算级别相同，从右至左；
*p-- ，等同于 (*p)--，先取 *p的值，再 p-1； 
*--p，等同于*(--p)， 先p-1，再取 *p的值；

## **Function declaration**

**Function declaration** must be ahead of main(), the function body could be after main();

**function declaration = signature/ prototype** = return type, function name, argument lists, eg.

`bool checkPrime(int)`

return type = `bool`

function name = `checkPrime`

argument lists = `int`

形参/ 形式参数；

实参/ 实际参数；

arguments pass between global or local.

**变量的作用域**

## Difference compare

### Array

```c
#include <iostream>
using namespace std;

void change(int a[])
{
	a[0]=30; a[1]=50;
}

int main()
{
	int a[2]={3,5};
	change(a);
	cout<<a[0]<<””<<a[1]<<endl;

	return 0;
}

**// output value 30 50**
```

Why function `void change()` could change the arguments in function `main()` ? 

because `main()` pass **the address of array** `a` to `change();`

then `change ()` visit **the address of array** in `main()`, and change the value of arguments in array.

- **array name** is a constant, not a variable, we can not change a, but can change the inside elements of a.

### Arguments

```c
#include <iostream>
using namespace std;

void change(int a, int b)
{
	a =30; b=50;
}

int main()
{
int a[2]={3,5};
change(a[0],a[1]);
cout<<a[0]<<””<<a[1]<<endl;

return 0;
}

**// output value 3 5**
```

Why here is no value change on array, because function `main()` pass the arguments of array to function `change()` directly. `void` type function has no return value, so there is no change to main();

 

## 冒泡排序

```cpp
#include <iostream>
using namespace std;

int order(n,a[])
{
for(int i=0; i<n; i++)
if (a[i]< a[i+1]){
	cout<< a[i]<< endl;}
else {
	cout<< a[i+1]<< endl;}

return 0;

}

int main()
{
int n=0, a[];
cin>> n;
cin>> a[n];
cout<<order(n, a[])<<endl;

return 0;
}

#include <iostream> // bubble sorting algorithm
    using namespace std;

    int main() {
        int n, a[1000]; // 一共n个数，n不超过1000。a用来保存这些数
        cin >> n;  
        // 输入n个数  
        for (int i = 0; i < n; i++) {
          cin >> a[i];
    }  
    // 冒泡，不断比较相邻的两个数，如果顺序错了，那么就交换
    for (int i = 0; i < n - 1; i++) {
      for (int j = 1; j < n - i; j++) {      
        if (a[j - 1] > a[j]) {
          int temp = a[j];
          a[j] = a[j - 1];
          a[j - 1] = temp;
        }    
      }  
    }  
    // 依次输出
   for (int i = 0; i < n; i++) {
     cout << a[i] << endl;  
   }  
   return 0;
}
```

the whole process of elements argument shift in the array

![Untitled](PKUC2%200359a7b662a44c898cca6e6dc7509377/Untitled.png)

| **a[8]** | **a[0]** | **a[1]** | **a[2]** | **a[3]** | **a[4]** | **a[5]** | **a[6]** | **a[7]** |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| **i** | 6 | 5 | 3 | 1 | 8 | 7 | 2 | 4 |
| **0** | 5 | 3 | 1 | 6 | 7 | 2 | 4 | 8 |
| **1** | 3 | 1 | 5 | 6 | 2 | 4 | 7 | 8 |
| 2 | 1 | 3 | 5 | 2 | 4 | 6 | 7 | 8 |
| 3 | 1 | 3 | 2 | 4 | 5 | 6 | 7 | 8 |
| 4 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 |

n = 8 

j=1, j < 8-i 

a[j - 1] > a[j]?

`i` deal with the outer for loop, output the value on the **row** above;

`j` deal with the inner for loop, output the value on the **colum** above;

**Programming Assignment: 综合编程练习（1）**

**＃1：寻找下标**

```cpp
#include <iostream>
using namespace std;

int seek(a[])
{
for(int i=0;i<n;i++)
	{
	if(x[i]=i){return i;}
	else {return "N";}
	return 0;
	}
}

int n(n>0, n<100), a[n];
int main()
{
cin>> n;
cin>> a;
seek(a[n]);
cout<<seek(a)<<endl;

return 0;
}

**// output value** 
```

```cpp
#include <iostream>
using namespace std;

int seek(int a[], int n)
{
int i;
for(i=0;i<n;i++)
{
if(a[i]==i)
{
return i;
}
}
return -1;
}

int main()
{
int n;
cin >> n;
if(n <= 0 || n >= 100)
{
cout << "Invalid input value for n. Please enter a value between 1 and 99." << endl;
return 0;
}
int a[n];
for(int i=0;i<n;i++)
{
cin >> a[i];
}
int result = seek(a, n);
if(result == -1)
{
cout << "N" << endl;
}
else
{
cout << "a[" << result << "] = " << a[result] << endl;
}
return 0;
}
