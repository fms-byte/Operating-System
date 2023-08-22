#!/bin/bash

read -p "Enter the directory path: " directory

# Check if the provided argument is a directory
if [ ! -d "$directory" ]; then
    echo "$directory is not a directory."
    exit 1
fi

# Initialize counters for files and subdirectories
file_count=0
dir_count=0

# Loop through all items in the directory
for item in "$directory"/*; do
    if [ -f "$item" ]; then
        file_count=$((file_count + 1))
    elif [ -d "$item" ]; then
        dir_count=$((dir_count + 1))
    fi
done

# Display the counts
echo "Number of files in $directory: $file_count"
echo "Number of subdirectories in $directory: $dir_count"

