# Process

```bash
sleep 10; # Halts prompt for 10s
```

```bash
coproc sleep 10; # Run a process without loosing control of a command prompt
```

```bash
kill -9 9486; # 9486 -> processID or CTRL + C if it's in the fg
```

```bash
sleep 30 &; # Run in Background
fg; # Run bg process in foregorund
```

```bash
jobs; # List of bg jobs
```

- Suspend Processes`CTRL+Z`

```bash
echo $-; # List available bash options
echo {a..z}; # Like a for loop that iterates a through z.
echo {a..z}{a..z}; # all possible combinations;
```

```bash
bash -c "echo \$$; echo \$-; ps --forest"; # Create a child shell with limited options.
```

```bash
ps -e; # Lists all processes that are running in the computer, not only the shell.
```

# Bit Calculator
```bash
bc; # Launches a calculator
```