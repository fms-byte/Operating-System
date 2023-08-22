#!/bin/bash

# Prompt the user for a directory name
read -p "Enter a directory name: " dirname

# Check if the provided argument is a directory
if [ ! -d "$dirname" ]; then
    echo "$dirname is not a directory."
    exit 1
fi

# Use the 'find' command to list all files and subdirectories
echo "Listing all files and subdirectories in $dirname:"
find "$dirname"

