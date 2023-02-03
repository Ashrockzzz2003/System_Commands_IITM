# Shell Variables

```bash
echo $HOME
```
- prints the value of the shell variable `HOME` to the console.

```bash
echo $USERANAME;
echo $HOME;
echo $HOSTNAME;
echo $PWD;
echo $PATH;
```

```bash
printenv;
env;
```

- both print all shell variables to the console.
- `$$` - special shell variable

```bash
echo $0; # name of the shell
echo $$; # process ID of the shell
echo $?; # return code of previously run program
echo $-; # flags set in the bash shell
```

```bash
echo "hello '
> line2
> line3
> "
# All lines read until "" are closed.
```

```bash
echo "$USERNAME"; # Gives me the value of the variable USERNAME
echo '$USERNAME'; # Gives me the string '$USERNAME'
```

```bash
echo "User: $USER; HOSTNAME: \$HOSTNAME;"; # omits HOSTNAME when "\" is used. Escape character.
```

```bash
echo ${var_name:="default_value"};
echo ${var_name:+"default"}; # if value is set, display default, else do nothing
```

```bash
echo ${!*}; # Get all variable names.
echo ${#var_name}; # Get length of the variable's value
echo ${var_name:5:4}; # var_name:offset:slice_length
```
```bash
# Pattern Matching

# Remove
echo ${var_name#pattern}; # match pattern once
echo ${var_name##pattern}; # match pattern max possible

# Keep and match
echo ${var_name%pattern}; # match pattern once
echo ${var_name%%pattern}; # match pattern max possible

# Match and replace
echo ${var_name/pattern/replace_string}; # match pattern once
echo ${var_name//pattern/replace_string}; # match pattern max possible
echo ${var_name/#pattern/replace_string}; # match at beggining
echo ${var_name/%pattern/replace_string}; # match at end

# Changing case
echo ${var_name,}; # Change first char to lower case
echo ${var_name,,}; # Change all chars to lower case
echo ${var_name^}; # Change first char to upper case
echo ${var_name^^}; # Change all chars to upper case

# Restrict types
declare -i var_name; # Only Integers
declare -l var_name; # Only lower case
declare -u var_name; # Only upper case
declare -r var_name; # Read only variable. Like const

# Remove restrictions
declare +i var_name;
declare +l var_name; 
declare +u var_name; 
declare +r var_name;

# Indexed Arrays
declare -a arr; # Declare arr as an indexed array
$arr[0]="value"; # Set value of element with index 0 in the array
echo ${arr[0]}; # Get the value of element in 0th index
echo $#{arr[@]}; # Number of elements in the array
echo ${!arr[@]}; # Display all used indices
echo ${arr[@]}; # Display values of all elements of the array
unset `arr[2]`; # Delete element ar index 2
arr+=("value"); # Append an element with value "value" at the end of the array.
```

# Process Control
```bash
fg
coproc
jobs
top
kill
```

```bash
ps; # List all process
ps -f; # list process along with parent
ps -e; # All Processes
ps --forest; # User readable list of processes.
```

# Program exit codes

| Code | Meaning |
| ----------- | ------- |
| 0 | success |
| 1 | failure |
| 2 | misuse |
| 126 | command cannot be executed |
| 127 | command not found |
| 130 | processes killed using `CTRL`+`C` |
| 137 | processes killed using `kill -9 <pid>` |
| ...... | ........ |

# Flags in BASH

| flag | meaning |
| ---- | ------- |
| h | locate and hash commands |
| B | brace expansion enabled |
| i | interactive mode |
| m | job control enabled |
| H | ! style history substituition enabled |
| s | comamnds are read from stdin |
| c | commands are read from arguments |