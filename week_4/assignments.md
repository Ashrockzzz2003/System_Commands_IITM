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