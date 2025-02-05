# 42- shell00/ C

Date: January 15, 2024

# shell

shebang line (**`#!/bin/bash`**

to tell the system which interpreter to use

## special or wired file name

delimeter \ tab, to show the special or wired file name such as :

```bash
% touch "23\\?\$*'MaRViN'*$?77&\\"
-rw-r--r--  1 linxu  2024_heilbronn  0 Jan 17 21:20 \?$*'MaRViN'*0\

% rm \\\?\$\*\'MaRViN\'\*0\\
# input \ and then click tab, the terminal will show us  \\?\$\*\'MaRViN\'\*0\\ automatically, 
# for us to confirm it automatically.

% ls -lRa *MaRV* | cat -e
-rw-r--r--  1 linxu  2024_heilbronn  3 Jan 17 21:51 "\?$*MaRViN*$?\"$

# the file size 3, it is wrong, use echo and terminator % to end the input
% echo -n 42 > \"\\\?\$\*MaRViN\*\$\?\\\"
% cat \"\\\?\$\*MaRViN\*\$\?\\\"
42%

# The function of the % mark is to indicate that the prompt is on the same line as the output, 
# because there is no linefeed character at the end of the output. This can help you distinguish 
# between the output and the prompt, and avoid confusion. However, some shells may use different 
# symbols or colors to indicate this situation.
```

# man

how to modify the file size, time, dates, link number, in terminal unix. how to use and read command manual.

search on man: man touch / timestamps

`man --help`

do I have to rm . and .. files? why I can not see it before?

regular expression?

# Git

find help in man for git commit

`man git-commit`

```bash
% git push
Gitea: Unauthorized
User: 2016:linxu with Key: 178248:linxu 2024-01-15T16:35:57Z is not authorized to write to vogsphere/intra-uuid-a7fdbb05-95fc-4350-8234-520c05a64f1c-5415498-linxu.
fatal: Could not read from remote repository.
Please make sure you have the correct access rights
and the repository exists.
```

because the remote repo is locked after git push and waiting for evaluation, after the evaluation, could be open again. this is the rule of the bootcamp.

## Git configuration

Name= ?

Email= ?

# chmod

change modification , permission ?

# Cat

concatenate 连接文件并打印到标准输出设备上。

```bash
% cat -e <filename>
ddk $
ll . $
;;sl $
$

% cat vv.txt
ddk
ll .
;;sl
```

**-e**      Display non-printing characters (see the **-v** option), and display a dollar sign (`$') at the end of each line.

# **Tar**

```bash
% tar -xpf <filename>
total XX
-r-----r-- 2 XX XX 1 Jun 1 23:44 test5 
lrwxrwxrwx 1 XX XX 5 Jun 1 22:20 test6 -> test0

% tar -xvf <filename>
total XX
-r-----r-- 2 XX XX 1 Jun 1 23:44 test5 
lrwxr--r-- 1 XX XX 5 Jun 1 22:20 test6 -> test0
```

-p keep the original permission of symbol link test0 - test6 in the tar file.

The -p option in the tar command is used to preserve the permissions and ownership of the files and directories when extracting them from an archive. [It is also known as the --preserve-permissions or --same-permissions option1](https://www.howtogeek.com/248780/how-to-compress-and-extract-files-using-the-tar-command-on-linux/)

# Create file and directory

- To create an empty file, you can use the **`touch`** command, followed by the name of the file. For example, you can type:

`touch myfile.txt`

This will create an empty file called **`myfile.txt`** [in the current directory1](https://stackoverflow.com/questions/14639353/how-do-i-create-a-new-directory-through-a-shell-script-in-linux)

- To create a file with some content, you can use the **`echo`** command with the redirection operator **`>`** or **`>>`**, followed by the name of the file. For example, you can type:

`echo "Hello world" > myfile.txt`

This will create a file called **`myfile.txt`** in the current directory, and write the text “Hello world” to it. If the file already exists, it will overwrite its content. If you want to append the text to the existing file, you can use the **`>>`** [operator instead](https://stackoverflow.com/questions/14639353/how-do-i-create-a-new-directory-through-a-shell-script-in-linux)[2](https://techpp.com/2021/08/22/create-file-using-command-prompt-guide/)

- To create a directory, you can use the **`mkdir`** command, followed by the name of the directory. For example, you can type:

`mkdir mydir`

This will create a directory called **`mydir`** in the current directory. You can also use the **`-p`** option to create multiple directories and subdirectories at once. For example, you can type:

`mkdir -p mydir/subdir1/subdir2`

This will create a directory called **`mydir`**, and two subdirectories called **`subdir1`** and **`subdir2`** [inside it](https://stackoverflow.com/questions/14639353/how-do-i-create-a-new-directory-through-a-shell-script-in-linux)[3](https://linuxize.com/post/how-to-create-directories-in-linux-with-the-mkdir-command/)

# Shell01

## FT_USER list group

To set the FT_USER variable for the above case, you can use the **`export`** command in your shell. The **`export`** [command allows you to define or modify environment variables for the current shell session1](https://stackoverflow.com/questions/38206797/comma-separated-list-from-ft-user)

For example, if you want to set the FT_USER variable to “nours”, you can type:

`export FT_USER=nours`

This will assign the value “nours” to the FT_USER variable, and make it available to other commands or scripts that use it. You can verify the value of the FT_USER variable by using the **`echo`** command. For example, you can type:

`echo $FT_USER`

[This will print the value of the FT_USER variable, which should be “nours”2](https://dev.mysql.com/doc/refman/5.7/en/fulltext-stopwords.html)

You can also change the value of the FT_USER variable by using the **`export`** command again with a different value. For example, if you want to set the FT_USER variable to “daemon”, you can type:

`export FT_USER=daemon`

This will overwrite the previous value of the FT_USER variable with “daemon”. You can check the new value by using the **`echo`** [command again](https://stackoverflow.com/questions/38206797/comma-separated-list-from-ft-user)[3](https://dev.mysql.com/doc/refman/8.0/en/fulltext-fine-tuning.html)

For more information on how to use the **`export`** and **`echo`** commands, you can use the **`man`** command to read their manual pages. For example, you can type **`man export`** to open the man page for the **`export`** command.

I see that you want to modify your .sh file and let it output the result as follows, without a newline or space after the output:

```bash
$>./print_groups.sh
nours,god,root,admin,master,nours,bocal$>
$>./print_groups.sh
daemon,bin$>

```

To do this, you can use the `printf` command with the `-n` option, which suppresses the newline character at the end of the output. For example, you can modify the .sh file as follows:

```bash
#!/bin/bash
printf -n "%s," $FT_USER
groups_list=$(groups $FT_USER)
printf "%s\n" $groups_list

```

This will print the output as below, depending on the value of the FT_USER variable:

```bash
$>./print_groups.sh
nours,god,root,admin,master,nours,bocal$>
$>./print_groups.sh
daemon,bin$>

```

For more information on how to use the `printf` command and its options, you can use the `man` command to read its manual page. For example, you can type `man printf` to open the man page for the `printf` [command1](https://stackoverflow.com/questions/12524308/bash-strip-trailing-linebreak-from-output)

[1](https://stackoverflow.com/questions/12524308/bash-strip-trailing-linebreak-from-output): [How to use printf command in Linux - LinuxConfig.org](https://stackoverflow.com/questions/12524308/bash-strip-trailing-linebreak-from-output)

# Find

explain the code one by one.

`$ find . -type f -o -type d | wc -l | tr -d ' '
 2$`

including current file and directory. actually there is only 1 file in the directory, so it shows 2.

# Shell00

## Slack

safari doesn’t work, Chrome is better.

must accept invitation and confirm in the email registered from admin, then we can join the slack channel.

## Exercise 02:

### file timestamps modification

`drwx--xr-x  2 linxu  2024_heilbronn    68  1 Jun  2024 test0`
I found it's impossible to change the timestamp to below.
`drwx--xr-x  2 linxu  2024_heilbronn    68  1 Jun 12:34 test0`

it's not mandatory to change year to time(hours, minutes), I am curious about some peers said they can change by the below command.
`touch -h -t 06011234 test0`

`touch -mt 202406010000.00 test6`
Actually it doesn't work, even gpt doesn't know how to do.

if you know the solution, and when you are available for a minute, please tell me, I will come to your desk for the above question.

### change file size

by command truncate? no, there is no such function, not allowed to install without admin’s password. 

so edit files by hand, and reach to the specific size.

**Directory size change.**

unix terminal command
change directory size to XX, such as below?
drwx--xr-x 2 XX XX XX Jun 1 20:47 test0

I don't have password to change the directory size , I am not admin, can I change it in the directory manually, without command in terminal?

**link numbers change**

r-----r-- 1 linxu 2024_heilbronn 1 Jan 16 15:02 test3

r-----r-- 1 linxu 2024_heilbronn 1 Jan 16 15:02 test5

`ln test3 test5`(but test5 should not exist in the directory) 

**symbol link**

drwx--xr-x 2 XX XX XX Jun 1 20:47 test0

lrwxrwxrwx 1 XX XX 5 Jun 1 22:20 test6 -> test0

how to keep the original different file permission?

Command:

`ln -s test0 test6`

`chmod –h 777 test6`

Symbol link

## Exercise 04: midLS

To list all files and directories in your current directory (except for hidden files or any file that starts by a dot), separated by a comma and a space, by order of modification date, you can use the following command in your terminal:

~~ls -lt | grep -v '^\.' | grep -v 'midLS' | awk '{if ($1 ~ /^d/) {printf "%s/, ", $9} else {printf "%s, ", $9}}' | sed 's/,$/\n/' > midLS~~

ls (-t -m -p || -tmp|| -tem)

Here is what each part of the command does:

- ls -1t: lists all files and directories in the current directory, sorted by modification date, with one entry per line.
- -group-directories-first: groups directories before files.
- -ignore=".*": ignores hidden files and directories.
- sed 's/$/,/': appends a comma to the end of each line.
- sed 's/\/$/\//': appends a slash to the end of each directory name.
- tr -d '\n': removes the newline character at the end of the output.

This will output a comma-separated list of all files and directories in your current directory (except for hidden files or any file that starts by a dot), separated by a comma and a space, by order of modification date. The directory names will be followed by a slash character.

Let me know if you have any further questions!

## Errors

git add, commit 1-1. good habits

modify date time, file size, links number all the same  as guide manual.

 

# C

Check norm in terminal and editor

% 

compile 

cc <filename.c>

./a.out | cat -e

```c
#include <string.h>
#include <unistd.h>

void	ft_putstr(char *str)
{
write(1, str, strlen(str));
}

int	main(void)
{
char	*c;

c = "Hello world";
ft_putstr(c);

// c is an address, why 	c = "Hello world";
