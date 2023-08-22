#!/bin/bash
read -p "Enter the directory name: " dirname
find "$dirname" -type f -mtime -1
