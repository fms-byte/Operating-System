#!/bin/bash

read -p "Enter filename: " filename

# Check if the provided argument is a file
if [ ! -f "$filename" ]; then
    echo "$filename is not a file or does not exist."
    exit 1
fi

# Monitor the log file in real-time
echo "Monitoring log file: $filename"
echo "Press Ctrl+C to exit."
tail -f "$filename"

