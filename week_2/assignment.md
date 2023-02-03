# PPA_1

Create a file `documents.txt` containing all the possible file names in the format `file_XYZ.txt` where X is a lower case alphabet, Y is also a lower case alphabet and Z is a number between 0 and 4. Few examples of file names in this format are 'file_dh3.txt', 'file_sd1.txt', 'file_ja0.txt', 'file_at2.txt'. The file names in `documents.txt` should be separated by a single space.


Hint: Use echo to solve this with a single command.

```bash
echo file_{a..z}{a..z}{0..4}.txt > documents.txt;
```

# PPA_2

`encoding-key` is a file located at the path `/encryption/two-level/binary/positive-offset/`(directory 'encryption' is located in current working directory) . The file `encoding-key` is updated often and shared between multiple users. This file is important to you and you are worried that the file could be deleted by mistake. Create a file `ek` in the current working directory, such that it is always in sync with the contents of file `encoding-key` and if `encoding-key` gets deleted by any chance the content in it should be available in file ek.

```bash
mkdir -p /encryption/two-level/binary/positive-offset/;
touch /encryption/two-level/binary/positive-offset/encoding-key;
ln /encryption/two-level/binary/positive-offset/encoding-key ek;
```

# GrPA_1

Print the absolute path where the command `wget` is located.

```bash
which wget;
```

# GrPA_2

`dir_1` and `dir_2` are directories in current working directory. Create a symbolic(soft) link to the file `file_1` present in `dir_1` and store it as `file_2` in `dir_2`.

`Hint`: The link to file_2 should be either absolute from current working directory i.e. / or relative to `dir_2`.

```bash
mkdir dir_1 dir_2;
touch dir_1/file_1;
ln -s $(pwd)/dir_1/file_1 dir_2/file_2;
```

# GrPA_3

Print the username associated with the current session.

```bash
echo $USER;
```

# GrPA_4

Print to the output containing the name of the shell being used, its PID and the flags in the following format `Shell:<shell>|PID:<pid>|Flags:<flags>`. There are no spaces in the string.

```bash
echo "Shell:$SHELL|PID:$$|Flags:$-";
```

# GrPA_5

Write a command that runs in a child shell, prints "hello" and exits with the exit code 179.

```bash
bash -c 'echo "hello"; exit 179';
```