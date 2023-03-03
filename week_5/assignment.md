# PPA

## PPA_1

Write a bash script that accepts any number of arguments and print the odd numbered arguments, i.e. first argument($1), third argument($3), fifth argument($5) and so on. 
In the output the values of the arguments should be separated by a space and printed on the same line.

```bash
#!/bin/bash

for ((i=1; i<=$#; i++))
do
        if (( $i % 2 == 1  )); then
                echo -n "${!i} "
        fi
done
echo ""
```

## PPA_2

A finance company called `Fintech` does not have its own analytics team, rather they outsources their analytics work to external vendors. The company maintains a file for each investor they are interested in, with the filename in the format 'firstname_lastname' in the directory 'data'(directory 'data' is in the current working directory). They do not want to make their investor details public so they rename each investor file to the hash value of filename before giving it to the external vendors and store the mapping in the file named map. Assume that no two investors have same combination of 'firstname' and 'lastname'.

The analytics team(external vendor) received the files of several investors named as some hash value. They analysed and identified some potential investors for the company and stored the hashed file names(one on each line) corresponding to the identified investors in a file named 'result'. The 'firstname_lastname' file contains the potential investment amount and duration details. Refer the provided sample data for sample file formats and architecture.

Write a bash script to print the sum of investment amounts of all the investors identified by the analytics team whose names(hash values) are present in the file 'result'. 

### Architecture and Sample Data

```
$ ls -Rl
.:
total 4
drwxrwxrwx 1 user user 512 Dec 11 19:48 data
-rwxrwxrwx 1 user user 435 Dec 11 20:53 map
-rwxrwxrwx 1 user user 195 Dec 11 20:53 result
​
./data:
total 0
-rwxrwxrwx 1 user user 36 Dec 11 20:53 Billie_Barron
-rwxrwxrwx 1 user user 36 Dec 11 20:53 Jeremiah_Brennan
-rwxrwxrwx 1 user user 36 Dec 11 20:53 Long_Mclaughlin
-rwxrwxrwx 1 user user 35 Dec 11 20:53 Lorna_Trevino
-rwxrwxrwx 1 user user 35 Dec 11 20:53 Mandy_Mueller
​
$ cat ./data/Billie_Barron
INVESTMENT $16319
FROM 2026
TO 2026
​
$ cat map
bb1cc74d6e8c40efdbbbc0e6a657fca02a533fe7f438d5b09b47b43e31cb9a45 ./data/Mandy_Mueller
fe818c4ac047523ac14dbb341f365bbfcd857268a6bfb70d9abb701a80bfb9c3 ./data/Lorna_Trevino
e8b80161e4110a791a0d7c3e40a04099fc75f0e348c2033efe79a2a930a71e98 ./data/Long_Mclaughlin
b1b1222a15fcd532e511d0f461dbe7ae7bda825b68bc510eec2a22cbddd5dad2 ./data/Billie_Barron
6051c4f27079a41afc99a97f0fc7bb8ba2789cd282f4cd10a71c6a954089b63e ./data/Jeremiah_Brennan
​
$ cat result
bb1cc74d6e8c40efdbbbc0e6a657fca02a533fe7f438d5b09b47b43e31cb9a45
fe818c4ac047523ac14dbb341f365bbfcd857268a6bfb70d9abb701a80bfb9c3
e8b80161e4110a791a0d7c3e40a04099fc75f0e348c2033efe79a2a930a71e98
​
$ grep INVESTMENT -r
data/Billie_Barron:INVESTMENT $16319
data/Jeremiah_Brennan:INVESTMENT $29440
data/Long_Mclaughlin:INVESTMENT $25906
data/Lorna_Trevino:INVESTMENT $1360
data/Mandy_Mueller:INVESTMENT $7979
```

### Expected output for above data

```bash
35245
```

```bash
#!/bin/bash

# Filename Format: ./firstname_lastname

# data
# map
# result

# Find investor_name from result

total=0

while read investor_hash; do
        # Find investor file
        investor_data_path=$(grep "$investor_hash" map | cut -d " " -f2)
        # Find amount invested by the investor
        invested_amount=$(grep "INVESTMENT" $investor_data_path | cut -d "$" -f2)
        # Add to total
        total=$((total + invested_amount))
done < result

echo $total
```


## PPA_3

Consider a file named data.txt in the current working directory. Write a script to determine if this file has more than 16 lines or not. Your script should print Yes if the lines are more than 16; else print No.

```bash
#!/bin/bash

if [[ $(wc -l data.txt | cut -d " " -f1) -gt 16 ]]; then
        echo "Yes"
else
        echo "No"
fi
```

# GrPA

## GrPA_1

Write a bash script which takes one argument as the name of a file and prints Yes if the file has read permission only for the owner and no other permissions for owner or other users, else do not print anything. The file given in the argument will be present in the current working directory.

```bash
#!/bin/bash


file_permission=$(ls -l | grep $1 | cut -d " " -f1)

if [[ $file_permission =~ "-r--------" ]]; then
        echo "Yes"
fi
```

## GrPA_2A

Write a bash script that accepts a few arguments(all numbers) and performs the following functions.

Prints the string Error if the number of arguments supplied is not equal to 2.
If the number of arguments is equal to two, print their sum.

```bash
#!/bin/bash

if [[ $# -ne 2 ]]; then
        echo "Error"
else
        echo $(( $1 + $2 ))
fi
```

## GrPA_2B

Write a bash script that reads a value from the standard input stream and prints PNUM if the value is a postive number or 0; prints NNUM if it is a negative number; else print STRING.

```bash
#!/bin/bash

read n

if [[ $n =~ ^-?[0-9]+\.?[0-9]*$ ]]; then
        if (( $(echo "$n >= 0" | bc -l) )); then
                echo "PNUM"
        else
                echo "NNUM"
        fi
elif [[ $n =~ ^-?+\.?[0-9]*$ ]]; then
        if (( $(echo "$n >= 0" | bc -l) )); then
                echo "PNUM"
        else
                echo "NNUM"
        fi
else
        echo "STRING"
fi
```

## GrPA_3

Write a bash script that takes any number of inputs(all numbers) and prints the maximum and minimum value from all the inputs in the format Maximum: max | Minimum: min, where max is the maximum value and min is the minimum value.

```bash
#!/bin/bash

max=$1
min=$1

for n in "${@:2}"; do
        if [[ $n =~ ^-?[0-9]+\.?[0-9]*$ ]]; then
                if (( $(echo "$n > $max" | bc -l) )); then
                        max=$n
                fi
                if (( $(echo "$n < $min" | bc -l) )); then
                        min=$n
                fi
        fi
done

echo "Maximum: $max | Minimum: $min"
```


## GrPA_4

Write a bash script that takes a number as an argument and prints "Yes" if the number is a prime number, else prints "No".

```bash
#!/bin/bash

n=$1

if (( $n >= 2 )); then
        for (( i=2; i*i<=$n; i++ )); do
                if (( $n % $i == 0 )); then
                        echo "No"
                        exit 0
                fi
        done
        echo "Yes"
else
        echo "No"
fi
```

## GrPA_5

Write a bash script that takes two integer values as input, and prints the product table of first integer with all the integers from 1 to the value in second argument as described in the format below.

Let the first argument be 3 and the second argument be 4, then your script should print.

```
3*1=3
3*2=6
3*3=9
3*4=12
```

If the first argument is 12 and second argument is 3, then your script should print

```
12*1=12
12*2=24
12*3=36
```
Note that there is no space between any numbers, * or = sign in each line. And every product is printed on a new line.

```bash
#!/bin/bash

for (( i=1; i<=$2; i++ )); do
        echo $1*$i=$(( $1 * $i ))
done
```

## GrPA_6

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

## GrPA_7

Write a bash script that prints the sum of all even numbers of an array of numbers. The array variable is named as number_arr.

```bash
#!/bin/bash

read -a number_arr
sum=0
for n in "${number_arr[@]}"; do
        if [[ $(( $n % 2 )) -eq 0 ]]; then
                sum=$(( $sum + $n ))
        fi
done
echo $sum
```

## GrPA_8

Write a bash script that accepts an integer as argument and prints the corresponding day of week in capitals as given in the table below.

|Argument|1 or 8|2 or 9|3|4|5|6|7|
|--------|------|------|-|-|-|-|-|
|Output|SUNDAY|MONDAY|TUESDAY|WEDNESDAY|THURSDAY|FRIDAY|SATURDAY|

If the argument is greater than 9 print ERROR

Hint: Use case statement.

```bash
#!/bin/bash

if [[ $1 -gt 9 ]]; then
        echo "ERROR"
else
        weekdays=('ERROR' 'SUNDAY' 'MONDAY' 'TUESDAY' 'WEDNESDAY' 'THURSDAY' 'FRIDAY' 'SATURDAY' 'SUNDAY' 'MONDAY')
        echo ${weekdays[$1]}
fi
```


