#!/bin/bash

prefix="new_"

if [ $# -ne 1 ]; then
    echo "Usage: $0 <directory>"
    exit 1
fi

if [ ! -d "$1" ]; then
    echo "$1 is not a directory."
    exit 1
fi

cd "$1" || exit 1

for file in *; do
    if [ -f "$file" ]; then
        new_name="$prefix$file"
        mv "$file" "$new_name"
        echo "Renamed: $file to $new_name"
    fi
done

echo "All files renamed with prefix '$prefix' in $1"

