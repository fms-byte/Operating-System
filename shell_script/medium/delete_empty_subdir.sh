#!/bin/bash

# Prompt the user for a directory name
read -p "Enter a directory name: " dirname

# Check if the provided argument is a directory
if [ ! -d "$dirname" ]; then
    echo "$dirname is not a directory."
    exit 1
fi

# Function to delete empty subdirectories recursively, excluding symbolic links
delete_empty_subdirectories() {
    local dir="$1"

    # Loop through subdirectories and delete empty ones, excluding symbolic links
    for sub_dir in "$dir"/*/; do
        if [ -d "$sub_dir" ] && [ ! -L "$sub_dir" ]; then
            delete_empty_subdirectories "$sub_dir"
            if [ -z "$(ls -A "$sub_dir")" ]; then
                echo "Deleting empty directory: $sub_dir"
                rmdir "$sub_dir"
            fi
        fi
    done
}

# Call the function to delete empty subdirectories, excluding symbolic links
delete_empty_subdirectories "$dirname"

