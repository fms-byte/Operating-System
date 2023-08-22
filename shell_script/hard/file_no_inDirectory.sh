#!/bin/bash

# Function to count and display the number of files and subdirectories in a directory
count_files_and_subdirs_in_directory() {
    local dir="$1"

    # Count the number of files and subdirectories in the current directory
    local file_count=$(find "$dir" -type f | wc -l)
    local subdir_count=$(find "$dir" -type d | wc -l)

    # Subtract 1 to exclude the current directory itself
    subdir_count=$((subdir_count - 1))

    # Display the counts for the current directory
    echo "Directory: $dir"
    echo "Number of Files: $file_count"
    echo "Number of Subdirectories: $subdir_count"
    echo

    # Recursively count files and subdirectories in subdirectories
    for sub_dir in "$dir"/*/; do
        if [ -d "$sub_dir" ]; then
            count_files_and_subdirs_in_directory "$sub_dir"
        fi
    done
}

# Prompt the user for a directory name
read -p "Enter a directory name: " dirname

# Check if the provided argument is a directory
if [ ! -d "$dirname" ]; then
    echo "$dirname is not a directory."
    exit 1
fi

# Call the function to count files and subdirectories in the specified directory and its subdirectories
count_files_and_subdirs_in_directory "$dirname"

