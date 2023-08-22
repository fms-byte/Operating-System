#!/bin/bash
read -p "Enter a directory: " dirname
find "$dirname" -type f -exec du -ah {} + | sort -rh | head -n 5 
