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