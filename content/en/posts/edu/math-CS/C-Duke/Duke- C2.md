---
title: "Writing, Running, and Fixing Code in C"
date: 2023-11-21
categories:
  - IT
tags:
  - Internet
  - Math & CS
  - AI
---


Original Course link: [Writing, Running, and Fixing Code in C](https://www.coursera.org/learn/writing-running-fixing-code)


**Assignment**

[GitHub - mvirgo/c-programming: Code worked on for Duke's Intro to Programming in C course](https://github.com/mvirgo/c-programming/tree/master)

# UNIX basic

`cat` // output file to terminal 

`emacs`  // open file in editor Emacs (be attention for the command, use lowercase, not uppercase)

close a terminal tab, `ctrl + shift + w` 

close the entire terminal including all tabs, `ctrl + shift + q` 

`git`[http://git-scm.com/book/en/v2/](http://git-scm.com/book/en/v2/)

## Emacs command line

copy in Macos, `Esc-w` 

kill(cut), C-w

yank(paste), C-y

undo, C-x u 

help, [EmacsWiki: Emacs Newbie Key Reference](https://www.emacswiki.org/emacs/EmacsNewbieKeyReference)

[https://www.gnu.org/software/emacs/manual/html_node/emacs/index.html](https://www.gnu.org/software/emacs/manual/html_node/emacs/index.html)

# `void`

• `void` means that the function does not have a return value.

[C Functions - main, void](https://www.w3schools.com/c/c_functions.php)

[What is void in C](https://www.c-programming-simple-steps.com/what-is-void.html)

**A.6.7 Void** (on book: c-programming-language-v2)

# `main`

[在标准C中，**`main`**的唯一有效签名是：**`int main(void)`**和**`int main(int argc, char **argv)`**。**`int main()`**是一个旧式声明，表示**`main`**接受未指定数量的参数。不建议使用它，](https://stackoverflow.com/questions/18928279/how-does-int-main-and-void-main-work)

## C compiler

gcc - GNU Compiler Collection

*macros ?*

pound sign #

angle brackets <> 

### Debug

```c
#include <stdio.h>;
#include <stdlib.h>;
int main(void)
{printf("Hello World\n");
return EXIT_SUCCESS;
}

hello.c:1:19: warning: extra tokens at end of #include directive
1 | #include <stdio.h>;
	|                   ^
```

extra tokens ?

when run the code, why professor input so many command :

`$ gcc -o hello -Wall -Werror -pedantic -std=gnu99 hello.c`

`gcc`, compiler;

`-o`, define the name of files;

`hello`, execute file;

`hello.c`, source code file;

the details of the compiling process 

`hello.c - hello.i - hello.s - hello.o - hello` 

1. Preprocessing: `cpp hello.c -o hello.i`
**C Preprocessor** scan **source code file** and then save as **middle(temp) file** `hello.i`;
2. Compiling: `gcc -S hello.i -o hello.s`
**gcc** compile the **middle file** `hello.i` as **assembly file** `hello.s`;
3. Assembling: `as hello.s -o hello.o`
**Assembler** transfer **assembly file** `hello.s` as **object file** `hello.o`;
4. Linking: `gcc hello.o -o hello`
**linker** links together `hello.o`, other **object files and library files**, and create the final **execute file** `hello`;

 a short command for the above whole process.

`$ gcc hello.c -o hello`

### [mod](https://en.wikipedia.org/wiki/Modular_arithmetic)

15 ≡ 3 (mod 12)

### Max Function

more concise and readable way to write the code. 

```c
int w = max(size1, x_offset + size2);
```

define the **`max`** function, takes two integers as arguments and returns the larger of the two. It uses the ternary operator (**`?:`**) as below.

```c
int w = size1 > x_offset + size2 ? size1 : x_offset + size2;

int max(int a, int b) {
return (a > b) ? a : b;
}
```

# makefile

[https://www.gnu.org/software/make/manual/](https://www.gnu.org/software/make/manual/)


[Fancier make Options](https://www.coursera.org/learn/writing-running-fixing-code/supplement/kTFif/fancier-make-options)