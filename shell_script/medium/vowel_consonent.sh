#!/bin/bash

# Function to count vowels and consonants in a string
count_vowels_and_consonants() {
    local sentence="$1"
    local sentence_lower="${sentence,,}"  # Convert the sentence to lowercase
    local vowels=0
    local consonants=0

    for ((i = 0; i < ${#sentence_lower}; i++)); do
        local char="${sentence_lower:i:1}"
        if [[ "$char" =~ [aeiou] ]]; then
            vowels=$((vowels + 1))
        elif [[ "$char" =~ [a-z] ]]; then
            consonants=$((consonants + 1))
        fi
    done

    echo "Vowels: $vowels"
    echo "Consonants: $consonants"
}

# Prompt the user for a sentence
read -p "Enter a sentence: " input_sentence

# Call the function to count vowels and consonants
count_vowels_and_consonants "$input_sentence"

