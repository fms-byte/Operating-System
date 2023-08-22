#!/bin/bash

# Function to create a tar.gz archive of files in the directory
create_archive() {
    local dir="$1"
    local timestamp=$(date +"%Y%m%d%H%M%S")
    local archive_name="archive_${timestamp}.tar.gz"

    # Check if the provided directory exists
    if [ ! -d "$dir" ]; then
        echo "$dir is not a directory or does not exist."
        exit 1
    fi

    # Create a tar.gz archive of all files in the directory (excluding subdirectories)
    tar -czf "$archive_name" -C "$dir" --exclude="*/**" .

    # Check if the archive was created successfully
    if [ $? -eq 0 ]; then
        echo "Archive '$archive_name' created successfully in the current directory."
    else
        echo "Error creating the archive."
    fi
}

# Prompt the user for a directory name
read -p "Enter the directory name: " dirname

# Call the function to create the archive
create_archive "$dirname"

