#!/bin/bash
set -euo pipefail

usage() {
    echo "Usage: $(basename "$0") [FILE...]"
    echo
    echo "Rename files to snake_case: uppercase to lowercase, spaces to underscores."
    echo "Defaults to all files in the current directory if no arguments are given."
    echo
    echo "Examples:"
    echo "  $(basename "$0")              # renames ./*"
    echo "  $(basename "$0") *.pdf"
    echo "  $(basename "$0") file?.txt"
}

if [[ $# -gt 0 && ( $1 == -h || $1 == --help ) ]]; then
    usage
    exit 0
fi

rename_file() {
    local f="$1"
    local dir new_name new
    dir=$(dirname "$f")
    new_name=$(basename "$f" | sed 's/ /_/g; s/[A-Z]/\l&/g')
    new="$dir/$new_name"
    [[ "$f" != "$new" ]] && mv -- "$f" "$new"
}

if [[ $# -eq 0 ]]; then
    for f in ./*; do rename_file "$f"; done
else
    for f in "$@"; do rename_file "$f"; done
fi
