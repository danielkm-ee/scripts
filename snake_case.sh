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

if [[ $# -eq 0 ]]; then
    rename 'y/A-Z/a-z/; s/ /_/g' ./*
else
    rename 'y/A-Z/a-z/; s/ /_/g' "$@"
fi
