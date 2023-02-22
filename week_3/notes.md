# Week_3

## Executing multiple commands

```bash
cmd1 && cmd2; # cmd2 will be executed only if cmd1 succeeds.
cmd1 || cmd2; # cmd2 will not be executed if cmd1 succeeds.
```

## File descriptors

- `stdin`
- `stdout`
- `stderr`

## Redirection

```bash
<cmd> file_name; # cmd output passed to file_name file.
cat > file_name; # takes input from keyboard and stores it in file file_name. CTRL + D to close.
cat; # takes input from the keyboard and displays it on the screen as output. CTRL + D to close.
cat file_name; # displays the contents of the file file_name.
cat < file_name; # displays the contents of the file file_name.
<cmd> >> file_name; # output of cmd will be appended to file_name and not overwritten.
<cmd> 2> file_name; # stderr sent to file_name. Used for error logs.
<cmd> > file_name 2>&1; # stdout and stderr both goes to file_name;
<cmd_1> | <cmd_2>; # Pipe maps the output of the cmd_1 as input to the cmd_2.
<cmd> | tee file_; # Output of commad is sent to file as well as the screen.
```

## Best Practices

```bash
# Use silent and clean scripts. A sink for outputs to be discarded. Errors can be avoided and wiped out.
<cmd> > out_file 2> /dev/null; # Errors sent to /dev/null. [A special file that destroys the content]
```

## Package Management: apt

```bash
apt-cache pkgnames; # List all packages
apt-cache search keyword; # Search for a given package
apt-cache show -a package; # Show the records of a package
sha256sum file_name; # Show the SHA256 checksum encryption of the file.
sha251sum file_name; # Show the SHA1 checksum encryption of the file.
md5sum file_name; # Show the md5 checksum encryption of the file.

sudo cat /etc/sudoers; # Show list of super users.
sudo cat /etc/apt;

dpkg -l pattern; # List all packages whose names match the pattern.
dpkg -L package; # List installed files that came from packages.
dpkg -s package; # Report status of packages.
dpkg -S pattern; # Seach installed packages for a file.
```

## General

```bash
lsb_release -a; # Gives a descirption of the OS release notes
uname -a; # Get to know about kernel and architecture.
```