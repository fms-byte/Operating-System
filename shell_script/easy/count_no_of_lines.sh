#!/bin/bash
read -p "Enter the file name: " filename
line_count=$(wc -l < "$filename")
echo "The file $filename has $line_count lines"

