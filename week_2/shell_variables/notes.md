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

# Process Control
```bash
fg
coproc
jobs
top
kill
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