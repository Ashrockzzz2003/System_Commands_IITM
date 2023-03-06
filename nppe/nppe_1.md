# NPPE_1

## Problem_1

Write a bash command to move all the .txt files present in the current directory to the directory named level1 present inside the current directory. Do not move any other files other than .txt files anywhere from the current directory. 
Write only a single line bash command to perform the above task.


```bash
mv *.txt level1;
```

## Problem_2

encoding-key is a file located at the path /encryption/two-level/binary/positive-offset/(directory 'encryption' is located in current working directory) . The file encoding-key is updated often and shared between multiple users. This file is important to you and you are worried that the file could be deleted by mistake. Create a file ek in the current working directory, such that it is always in sync with the contents of file encoding-key and if encoding-key gets deleted by any chance the content in it should be available in file ek.

```bash
mkdir -p /encryption/two-level/binary/positive-offset/
touch /encryption/two-level/binary/positive-offset/encoding-key
ln /encryption/two-level/binary/positive-offset/encoding-key ek
```

## Problem_3

Add the string “EOF alpha” at the end of the file(starting at a new line) alpha.txt then append the contents of the file numbers.txt at the end of the file(starting at a new line) alpha.txt. alpha.txt and numbers.txt are located in the current working directory.

```bash
echo "EOF alpha" >> alpha.txt
cat numbers.txt >> alpha.txt
```

## Problem_4

Write a command to print the name of directories(in the current working directory) that have read, write and execute permissions for other users. Print only the directory name on each line.

```bash
ls -l | grep '^d.*[r][w][x]\b' | cut -d ":" -f 2 | cut -d " " -f 2;
```


## Problem_5

Write a bash script which takes one argument as the name of a file and prints Yes if the file has read permission only for the owner and no other permissions for owner or other users, else do not print anything. The file given in the argument will be present in the current working directory.

```bash
#!/bin/bash

file_permission=$(ls -l | grep $1 | cut -d " " -f1)

if [[ $file_permission =~ "-r--------" ]]; then
    echo "Yes"
fi
```

## Problem_6

Consider a directory named "perf_folder" containing some files with different extensions, present in the current working directory. Write a bash script that accepts an argument(name of destination directory), adds a prefix string "program_" to the file names in the directory "perf_folder" meeting the below criteria.
The file extension is ".c".
The file names should containing the substring perf.

Also move all the files meeting the above criteria after renaming to the directory(destination) whose name is specified as an argument to your script. The destination directory may or may not be present in the current working directory, if not present create the directory under current working directory.

For e.g. the argument to your script is perf_programs, i.e. perf_programs is the destination directory for renamed files.

If below is the output of ls perf_folder when run in your current working directory.

```
perf_results.cvc	perf_conf.xml		set_perf_input.c	perf_params.c
start_test.c	stop_test.c	results.txtscript.sh
```

Then after running your script, 
the new output of  running ls perf_folder in your current working directory should be,

```
perf_results.cvc	perf_conf.xml	start_test.c	stop_test.c	results.txt		script.sh
```
and output of running command ls perf_programs in your current working directory should be, 

```
program_set_perf_input.c	program_perf_params.c
```

```bash
#!/bin/bash
# perf_folder
mkdir $1
for line in $(ls -1 perf_folder | grep "\.c$" | grep "perf"); do
        mv perf_folder/$line perf_folder/program_$line
        mv perf_folder/program_$line $1
done
```


