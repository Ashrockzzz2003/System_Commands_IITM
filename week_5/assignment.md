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