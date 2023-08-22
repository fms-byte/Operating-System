#!/bin/bash

read -p "Enter a filename: " dirname

# Check if the provided argument is a file
if [ ! -f "$dirname" ]; then
    echo "$dirname is not a file."
    exit 1
fi

# Get word count, line count, and character count
word_count=$(wc -w < "$dirname")
line_count=$(wc -l < "$dirname")
char_count=$(wc -m < "$dirname")

char_count=$((char_count - line_count))

# Display the counts
echo "Word count: $word_count"
echo "Line count: $line_count"
echo "Character count: $char_count"

