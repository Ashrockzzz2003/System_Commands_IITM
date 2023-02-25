# PPA

## PPA 1

Write a command to print the name of directories(in the current working directory) that have read, write and execute permissions for other users. Print only the directory name on each line.

```bash
ls -l | grep '^d.*[r][w][x]\b' | cut -d ":" -f 2 | cut -d " " -f 2;
# Long List all directories
# grep those lines that is a directory, has rwx in the end
# split output by ":" and select 2nd option [We are using the : of time to split]
# Split again by space and select 2nd option
```

## PPA 2

The file `Pincode_info.csv` has information on the pin codes of some places. The output of the command head -5 Pincode_info.csv is given below. First line of this file gives the information about the sequence of fields in each line of file following it.

```csv
Circle Name,Region Name,Division Name,Office Name,Pincode,OfficeType,Delivery,District,StateName
Andhra Pradesh Circle,Kurnool Region,Anantapur Division,A Narayanapuram B.O,515004,BO,Delivery,ANANTHAPUR,Andhra Pradesh
Andhra Pradesh Circle,Kurnool Region,Anantapur Division,Akuledu B.O,515731,BO,Delivery,ANANTHAPUR,Andhra Pradesh
Andhra Pradesh Circle,Kurnool Region,Anantapur Division,Alamuru B.O,515002,BO,Delivery,ANANTHAPUR,Andhra Pradesh
Andhra Pradesh Circle,Kurnool Region,Anantapur Division,Allapuram B.O,515766,BO,Delivery,ANANTHAPUR,Andhra Pradesh
```

Write a command to display the Circle name and Division name separated by space for the given pincode  stored in a shell variable 'pin'. 
For  e.g. if 'pincode=515002' then your command should display 'Andhra Pradesh Anantapur'
Note: If your solution has more than one line, add a semicolon after each line.

```bash
cat Pincode_info.csv | grep $pin | cut -d "\"" -f 1,3 | cut -d "," -f 1,3 | sed "s/ Circle,/ /;s/ Division//";
```

# GrPA

## GrPA1

The poem “Sail away” by Rabindranath Tagore is stored in the file named poem.

```
Early in the day it was whispered that we should sail in a boat,
only thou and I, and never a soul in the world would know of this our
pilgrimage to no country and to no end.

In that shoreless ocean,
at thy silently listening smile my songs would swell in melodies,
free as waves, free from all bondage of words.

Is the time not come yet?
Are there works still to do?
Lo, the evening has come down upon the shore
and in the fading light the seabirds come flying to their nests.

Who knows when the chains will be off,
and the boat, like the last glimmer of sunset,
vanish into the night?
```

Write a command to print the number of non-empty lines that do not contain an article (a, an, the) in it. The command should print a number that is the count of lines, and should not print the lines.


```bash
# Filter lines that have a, an, the -> Invert check -> Filter non-empty lines -> Line count.
grep -e "\ba\b\|\ban\b\|\bthe\b" poem -v | grep -e "\w" | wc -l;

# Approach 2
egrep -v '\b(an?|the)\b|(^\s*$)' poem | wc -l;

```


## GrPA2

Each line in the file employees.csv contains the name, role and division of employees separated by a comma. Every line corresponds to one employee. The user wants to collect the details of employees who are managers in the R&D division. For managers the string for the role is ‘Manager’ and the division string for employees working in the R&D division is ‘R&D’.

Write a command to collect the required details and redirect the output to a file named “info.csv”. "info.csv" should contain the name, role and division (separated by a comma) of each employee (as per the above criteria) on a separate line.

```csv
Name,Role,Division
Hari,Team-Lead,R&D
Nirmal,GET,Production
Ruban,Manager,R&D
Aswath,Manager,Production
Nazar,Team-Lead,Production
Daniel,GET,R&D
```

```bash
cat employees.csv | grep -i "manager" | grep "R&D" > info.csv;
```

## GrPA3

Write a command that will print all the lines not containing the word gnu (case-insensitive) in the file test.txt present in the current working directory.

```bash
grep -i -v "gnu" ./test.txt;
```

## GrPA4

In a course, the instructor asked the students to submit their projects in a single file named as the student’s roll number. A typical roll number of a student is a 10 character string which is a combination of a four digit(decimal) year and six character hexadecimal number, e.g. "20201f3acd". The instructor specified that the name of the file should be in lower case but some students mistakenly used uppercase for their file names. Each file name is either entirely in lower case or entirely in upper case with numbers.

Your task is to create two arrays(shell variables) named lower and upper. Array lower should not contain the file names that have upper case letters and array upper should contain all the file names that have upper case letters.

Note: The project files are located in the current directory

Hint:

```bash
arr=(`ls`) # Each element in arr corresponds to the output from the ls
```

```bash
lower=(`ls -1 | grep "[0-9]{4}[0-9a-z]{6}"`);
upper=(`ls -1 | grep -v "[0-9]{4}[0-9a-z]{6}"`);
```

## GrPA5

The file `Pincode_info.csv` has information on the pin codes of some places. The output of the command head -5 Pincode_info.csv is given below. First line of this file gives the information about the sequence of fields in each line of file following it.

```csv
Circle Name,Region Name,Division Name,Office Name,Pincode,OfficeType,Delivery,District,StateName
Andhra Pradesh Circle,Kurnool Region,Anantapur Division,A Narayanapuram B.O,515004,BO,Delivery,ANANTHAPUR,Andhra Pradesh
Andhra Pradesh Circle,Kurnool Region,Anantapur Division,Akuledu B.O,515731,BO,Delivery,ANANTHAPUR,Andhra Pradesh
Andhra Pradesh Circle,Kurnool Region,Anantapur Division,Alamuru B.O,515002,BO,Delivery,ANANTHAPUR,Andhra Pradesh
Andhra Pradesh Circle,Kurnool Region,Anantapur Division,Allapuram B.O,515766,BO,Delivery,ANANTHAPUR,Andhra Pradesh
```

Assume that there are only 10 states for which this system works and the first digit of the pin code is unique for each state. That means for all the places in the entire state the first digit will be same. You are given a shell variable named state that contains a state name(Example: state=“Punjab”). Display the number of pin codes available in the file Pincode_info.csv within the state given in the variable state that has the same first and the last digit. For e.g. if the value of state = “Andhra Pradesh”, one such pin code is 515005(for the file given above).

Hint: First find the first digit that represents the given state.

```bash
egrep "$state" -i Pincode_info.csv | egrep -o "[0-9]{6}" | egrep "(.)....\1" | wc -l;
```


