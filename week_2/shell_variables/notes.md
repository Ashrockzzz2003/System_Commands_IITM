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