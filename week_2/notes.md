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

# Help

- man
- which
- apropos
- info
- whatis
- help
    - shows keywords reserved for the shell.
    - shell bulletin
- type
    - commmand type