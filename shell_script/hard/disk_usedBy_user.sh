#!/bin/bash

# Function to calculate and display disk usage by user within a directory
calculate_user_disk_usage() {
    local dir="$1"

    # Use the 'du' command to calculate disk usage by user
    du -h -c --max-depth=1 "$dir" 2>/dev/null | awk '{total += $1} END {print "Total:", total, "B"}'
}

# Prompt the user for a directory name
read -p "Enter the directory name: " dirname

# Check if the provided argument is a directory
if [ ! -d "$dirname" ]; then
    echo "$dirname is not a directory or does not exist."
    exit 1
fi

# Call the function to calculate and display disk usage by user
calculate_user_disk_usage "$dirname"

