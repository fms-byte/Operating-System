#!/bin/bash

calculate_factorial() {
    local n=$1
    local factorial=1

    for ((i = 1; i <= n; i++)); do
        factorial=$((factorial * i))
    done

    echo $factorial
}

read -p "Enter a number: " number

if [[ $number =~ ^[0-9]+$ ]]; then
    result=$(calculate_factorial $number)
    echo "The factorial of $number is $result"
else
    echo "Invalid input. Please enter a non-negative integer."
fi

