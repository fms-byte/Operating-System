#!/bin/bash

read -p "Enter a directory: " dirname

# Check if the provided argument is a directory
if [ ! -d "$dirname" ]; then
    echo "$dirname is not a directory."
    exit 1
fi

# Initialize variables to store the largest file size and its name
largest_file=""
largest_size=0

# Loop through all files in the directory
for file in "$dirname"/*; do
    if [ -f "$file" ]; then
        # Get the size of the file
        file_size=$(stat -c %s "$file")

        # Compare the size to the largest size found so far
        if [ "$file_size" -gt "$largest_size" ]; then
            largest_size=$file_size
            largest_file="$file"
        fi
    fi
done

# Check if a largest file was found
if [ -n "$largest_file" ]; then
    echo "The largest file in $dirname is '$largest_file' with a size of $largest_size bytes."
else
    echo "No files found in $dirname."
fi

