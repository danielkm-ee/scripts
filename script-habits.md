# Bash Scripting Habits

## Safety header

```bash
#!/bin/bash
set -euo pipefail
```

- `-e` — exit on first error
- `-u` — error on unset variables (catches typos like `$HOEM`)
- `-o pipefail` — pipeline fails if any stage fails, not just the last

---

## Special variables

| Variable | Meaning |
|---|---|
| `$0` | Script name |
| `$1`, `$2`, ... | Positional arguments |
| `$#` | Number of arguments |
| `$@` | All arguments as separate words |
| `$?` | Exit code of last command |
| `$$` | PID of current shell |
| `$!` | PID of last background process |

---

## `$@` vs `$*`

Always use `"$@"` to forward arguments — it preserves arguments with spaces.

```bash
args=("hello world" "foo")
for a in "$@"; do echo "$a"; done  # hello world / foo  ← correct
for a in "$*"; do echo "$a"; done  # hello world foo    ← smashed together
```

---

## Quote your variables

Unquoted variables are word-split and glob-expanded.

```bash
file="my report.pdf"
rm $file    # tries to rm "my" and "report.pdf" — wrong
rm "$file"  # correct
```

---

## `[[ ]]` over `[ ]`

Double brackets are safer: support `&&`/`||`, regex (`=~`), and don't require quoting the right-hand side.

```bash
[[ $name == "foo" ]]
[[ $str =~ ^[0-9]+$ ]]
[[ -f "$file" && -r "$file" ]]
```

---

## `$(...)` over backticks

Cleaner to read and nest.

```bash
result=$(cat $(find . -name "*.log"))   # clean
result=`cat \`find . -name "*.log"\``  # messy
```

---

## Arrays over space-separated strings

```bash
files=("a b.txt" "c.txt")        # array — elements preserved
for f in "${files[@]}"; do ...   # iterate safely
```

---

## Help messages

Always handle `-h` / `--help` and print usage. Use a `usage()` function so it's easy to update.

```bash
usage() {
    echo "Usage: $(basename "$0") [FILE...]"
    echo
    echo "Short description of what the script does."
    echo
    echo "Examples:"
    echo "  $(basename "$0") *.pdf"
}

if [[ $# -gt 0 && ( $1 == -h || $1 == --help ) ]]; then
    usage
    exit 0
fi
```

`$(basename "$0")` prints just the script filename, not its full path.

---

## Globbing

The shell expands globs *before* your script runs — `$@` already contains the matched filenames.

| Pattern | Matches |
|---|---|
| `*` | Any sequence of characters |
| `?` | Exactly one character |
| `[a-z]` | One character in range |
| `[!abc]` | One character not in set |
| `**` | Recursive paths (`shopt -s globstar`) |

Default to `./*` when no args are given:

```bash
if [[ $# -eq 0 ]]; then
    cmd ./*
else
    cmd "$@"
fi
```
