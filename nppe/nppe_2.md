# NPPE 2

# Problem 1

We have a file named "systemcommands.txt" in the present working directory. Write a Bash command to change its permissions to

user: read, write, execute
group: execute
others: write

```bash
chmod 712 systemcommands.txt
```

# Problem 2

"dir_1" and "dir_2" are directories in current working directory. Create a symbolic(soft) link to the file "file_1" present in "dir_1" and store it as "file_2" in "dir_2".
Hint: The link to file_2 should be either absolute from current working directory i.e. / or relative to dir_2.

```bash
mkdir dir_1 dir_2
touch dir_1/file_1
ln -s ${pwd}/dir_1/file_1 dir_2/file_2
```

# Problem 3

Given a shell variable month supposed to contain a string value corresponding to some calendar month. Use the cal command to create a file named as X.txt where X is the string value in the variable month. Your command should also create a file named error.txt that should contain the error message if the string month does not correspond to any calendar month. Create all the files in the current working directory.

For example:

If the variable month contains the string "nov", your solution should create a file named nov.txt containing the calendar of november month and error.txt should be empty.
And if the variable month contains the string "garbage", your solution should create a file named error.txt containing the error from cal command and garbage.txt should be empty.

```bash
read month
cal -m $month > $month.txt 2> error.txt
echo --$month.txt--
cat $month.txt
echo
echo --error.txt--
cat error.txt
```

# Problem 4

Each line in the file employees.csv contains the name, role and division of employees separated by a comma. Every line corresponds to one employee. The user wants to collect the details of employees who are managers in the R&D division. For managers the string for the role is ‘Manager’ and the division string for employees working in the R&D division is ‘R&D’.

Write a command to collect the required details and redirect the output to a file named “info.csv”. "info.csv" should contain the name, role and division (separated by a comma) of each employee (as per the above criteria) on a separate line.


```bash
grep "Manager" employees.csv | grep "R&D" > info.csv
```

# Problem 5

Write a bash script that accepts any number of arguments and print the odd numbered arguments, i.e. first argument($1), third argument($3), fifth argument($5) and so on. 
In the output the values of the arguments should be separated by a space and printed on the same line.

```bash
#!/bin/bash

for ((i=1; i<=$#; i++))
do
    if [[ $i%2 -eq 1 ]]; then
        echo -n "${!i} "
    fi
done
echo ""
```

# Problem 6

The file Pincode_info.csv has information on the pin codes of some places. A sample output of the command head -5 Pincode_info.csv is given below. First line of this file gives the information about the sequence of fields in each line of file following it.

```
Circle Name,Region Name,Division Name,Office Name,Pincode,OfficeType,Delivery,District,StateName
Andhra Pradesh Circle,Kurnool Region,Anantapur Division,A Narayanapuram B.O,515004,BO,Delivery,ANANTHAPUR,Andhra Pradesh
Andhra Pradesh Circle,Kurnool Region,Anantapur Division,Akuledu B.O,515731,BO,Delivery,ANANTHAPUR,Andhra Pradesh
Andhra Pradesh Circle,Kurnool Region,Anantapur Division,Alamuru B.O,515005,BO,Delivery,ANANTHAPUR,Andhra Pradesh
Andhra Pradesh Circle,Kurnool Region,Anantapur Division,Allapuram B.O,515766,BO,Delivery,ANANTHAPUR,Andhra Pradesh
```

Assume that there are only 10 states for which this system works and the first digit of the pin code is unique for each state. That means for all the places in the entire state the first digit will be same. You are given a shell variable named state that contains a state name(Example: state=“Punjab”). Display the number of pin codes available in the file Pincode_info.csv within the state given in the variable state that has the same first and the last digit. For e.g. if the value of state = “Andhra Pradesh”, one such pin code is 515005(for the file given above).

Hint: First find the first digit that represents the given state.

```bash
# egrep "$state" -i Pincode_info.csv | egrep "[0-9]{6}" -o | egrep "(.)....\1" | wc -l
```

```bash
number=`egrep -i "$state" Pincode_info.csv | head -1 | egrep -o [0-9]{6} | cut -c1`
egrep -i "$state" Pincode_info.csv | egrep -o "$number[0-9]{4}$number" | wc -l
```





