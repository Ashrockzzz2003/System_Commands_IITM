# Shell Scripting

- Script is of two types
	- sourced
	- executed
- Keep the script in folder `$PATH`

# Bash Environment

## Login Shell

```bash
/etc/profile
~/.bash_profile
~/.bash_login
~/.profile
```

## Non-Login Shell

```bash
/etc/bash.bashrc
~/.bashrc
```

# Notes

```bash
echo "My home is $HOME"
printf "My home is %s\n" $HOME;
```

# Shell Script Arguments

|Command|Meaning|
|-------|-------|
|`$0`|Name of shell|
|`$#`|Number of args passed|
|`$1`|First Argument|
|`${n}`|nth Argument|
|`$*`|All arguments at once as a single string|
|`$@`|All arguments at once as separate strings|

# Bash Script

```bash
# For var loop
for var in list
do
	commands
done
```

```bash
case var in
pattern1)
	commands
	;;
pattern2)
	commands
	;;
esac
```

```bash
if condition
then
	commands
fi

# Similar to c
if condition; then
	commands
fi
```

```bash
test -e file; # Test if expression exists in file
# Different ways
[ -e file ];
[[ $ver == 5.* ]];
(( $v ** 2 > 10 ));
wc -l file;
```
