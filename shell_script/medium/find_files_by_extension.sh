#!/bin/bash
read -p "Enter the directory name: " dirname
read -p "Enter the file extension: " extension
find "$dirname" -type f -name "*$extension" 

