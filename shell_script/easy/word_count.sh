#!/bin/bash

read -p "Enter a sentence:" sentence

word_count=$(echo "$sentence" | wc -w)

echo "The sentence '$sentence' contains $word_count words."

