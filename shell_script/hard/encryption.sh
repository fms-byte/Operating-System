#!/bin/bash

# Function to encrypt a single character using a substitution cipher
encrypt_char() {
    local char="$1"
    local key="$2"
    local alphabet_lower="abcdefghijklmnopqrstuvwxyz"
    local alphabet_upper="ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    
    # Check if the character is a lowercase letter
    if [[ $alphabet_lower == *"$char"* ]]; then
        echo -n "${alphabet_lower:$(( ($(printf '%d' "'$char") - $(printf '%d' 'a') + key) % 26 )):1}"
    # Check if the character is an uppercase letter
    elif [[ $alphabet_upper == *"$char"* ]]; then
        echo -n "${alphabet_upper:$(( ($(printf '%d' "'$char") - $(printf '%d' 'A') + key) % 26 )):1}"
    else
        echo -n "$char"
    fi
}

# Function to encrypt the contents of a file using a substitution cipher
encrypt_file() {
    local filename="$1"
    local key="$2"
    local encrypted_text=""

    while IFS= read -r -n 1 char; do
        encrypted_text+="$(encrypt_char "$char" "$key")"
    done < "$filename"

    echo "$encrypted_text"
}

# Prompt the user for the file name
read -p "Enter the file name: " filename

# Check if the provided argument is a file
if [ ! -f "$filename" ]; then
    echo "$filename is not a file or does not exist."
    exit 1
fi

# Prompt the user for the substitution key
read -p "Enter the substitution key (an integer between 1 and 25): " key

# Check if the key is a valid integer between 1 and 25
if ! [[ "$key" =~ ^[1-9]$|^[1][0-9]$|^2[0-5]$ ]]; then
    echo "Invalid key. Please enter an integer between 1 and 25."
    exit 1
fi

# Encrypt the contents of the file using the provided key
encrypted_contents=$(encrypt_file "$filename" "$key")

# Write the encrypted contents back to the file
echo -n "$encrypted_contents" > "$filename"

echo "File '$filename' encrypted successfully using a substitution cipher with key $key."

