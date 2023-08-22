#!/bin/bash

# need to run : sudo apt-get install fdupes

# Function to find and display duplicate files based on content
find_duplicate_files() {
    local dir="$1"

    # Check if the provided argument is a directory
    if [ ! -d "$dir" ]; then
        echo "$dir is not a directory."
        exit 1
    fi

    # Use fdupes to find and display duplicate files
    fdupes -r "$dir"
}

# Prompt the user for a directory name
read -p "Enter the directory name: " dirname

# Call the function to find and display duplicate files
find_duplicate_files "$dirname"

