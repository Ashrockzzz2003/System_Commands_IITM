# File Sizes

- `ls -l`
- `stat`
- `du`
- Role of block size.

# Links

- Hard Links
- Symbolic Links

# ln

```bash
ln -s file1 file2
```

```
562949953635468 -rwxrwxrwx 2 ashrock_m13 ashrock_m13 0 Feb  1 17:08 file1
562949953635470 lrwxrwxrwx 1 ashrock_m13 ashrock_m13 5 Feb  1 17:08 file2 -> file1
```
- make symbolic links between files.
- `file2` is a symbolic link to `file1`.

```bash
ln file1 file3
```
```
562949953635468 -rwxrwxrwx 2 ashrock_m13 ashrock_m13 0 Feb  1 17:08 file1
562949953635470 lrwxrwxrwx 1 ashrock_m13 ashrock_m13 5 Feb  1 17:08 file2 -> file1
562949953635468 -rwxrwxrwx 2 ashrock_m13 ashrock_m13 0 Feb  1 17:08 file3
```
- `file3` is a hard link to `file1`.

# wc

```bash
wc filename
```
- lines words bytes filename

```bash
wc -l filename
```
- only first 5 lines

# alias

```bash
alias ll='ls -l'
```
- `ll` will now work the same way as `ls -l`.

```bash
alias
```
- know your aliases

```bash
unalias ll
```
- remove the alias `ll`

# touch

```bash
touch file_name.extension
```
- `touch` creates new file in `pwd`.

```bash
touch file1 file2 file3
```
- create multiple files.

# mkdir

```bash
mkdir dir_name
```
- create directory `dir_name` in `pwd`.

# cp

```bash
cp filename directory
```
- copy `filename` in `pwd` to `directory`.

```bash
cp file1 file2
```
- overwrites `file2` with `file1`'s content.

```bash
cp dir_1 dir_2
```
- happens only if `dir_2` exists.

```bash
cp -r dir_1 dir_2
```
- happens even if `dir_2` does not exist.

# mv

```bash
mv dir_1 dir_2
```
- automatically assumes `-r` by default.

# rm

```bash
rm file1
```
- removes files.
- doesn't remove directories by default.

```bash
rm -r dir_name
```
- removes directories `empty and non-empty`

# rmdir

```bash
rmdir dir_name
```
- removes only `empty` directories.

# Help

- `man`
- `which`
- `apropos`
- `info`
- `whatis`
- `help`
    - shows keywords reserved for the shell.
    - shell bulletin
- `type`
    - prints commmand type