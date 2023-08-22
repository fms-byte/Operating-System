#!/bin/bash
read -p "Enter the file name: " filename
cat "$filename"
read -p "Enter the word to replace: " word1
read -p "Enter the new word: " word2
sed -i "s/$word1/$word2/g" "$filename"
echo "The new file is:"
cat "$filename"
