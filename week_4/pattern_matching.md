# Pattern Matching

## Regex

- pattern template to filter text
- REGularEXpression
- Two types of engines
    - `BRE` [POSIX Basic Regular Expression engine]
    - `ERE` [POSIX Extended Regular Expression engine]
- Tools: [`grep`, `sed`, `awk`]

```bash
grep `pattern` filename;
command | grep `pattern`;
egrep `pattern` filename; # Use ERE engine
grep -E `pattern` filename; # Use EE engine
grep -i `pattern` filename; # Case Insensitive matching
```

|Symbol|Description|
|------|-----------|
|`.`|Any single character except null or newline|
|`*`|Zero or more of the preceeding character/expression|
|`[]`|Any of the enclosed charaters; hyphen `-` indicates character change. List of characters to match|
|`^`|Anchor of the beginnning of line or negation of enclosed characters|
|`$`|Anchor for end of line|
|`\`|Escape Special Characters|
|`\b`|Word Boundary. Match the last 2 letters of all words|

## Special Characters [BRE]

|Symbol|Description|
|------|-----------|
|`\{n,m\}`|Range of occurances of preceeding pattern at least n and utmost m times.|
|`\(\)`|Grouping Of RegEX|

## Special Characters [ERE]

|Symbol|Description|
|------|-----------|
|`{n,m}`|Range of occurances of preceeding pattern at least n and utmost m times.|
|`()`|Grouping of RegEX|
|`+`|One or more of preceeding character / expression|
|`?`|Zero or onr of the preceeding character / expression|
|`|`|Logical OR over the patterns|

## Backreferences

```bash
\(hello\).*\1; # \1 matches (hello\) twice inbetween them any number of characters may occur
```

## BRE Operator Precedence
- `..`, `==`, `::`: Character Collation
- \metachar
- [] Bracket Expression
- \(\) \n subexpressions and backreferences
- * \{ \} Repetition of preceedign single char ReGEX
- Concatenation
- ^ $ anchors



