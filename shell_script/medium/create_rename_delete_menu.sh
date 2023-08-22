#!/bin/bash

# Function to display the menu
display_menu() {
    clear
    echo "File Management Menu:"
    echo "1. Create a file"
    echo "2. Rename a file"
    echo "3. Delete a file"
    echo "4. Exit"
}

# Function to create a file
create_file() {
    read -p "Enter the name of the file to create: " filename
    touch "$filename"
    echo "File '$filename' created."
}

# Function to rename a file
rename_file() {
    read -p "Enter the current name of the file: " oldname
    read -p "Enter the new name for the file: " newname
    if [ -e "$oldname" ]; then
        mv "$oldname" "$newname"
        echo "File '$oldname' renamed to '$newname'."
    else
        echo "File '$oldname' not found."
    fi
}

# Function to delete a file
delete_file() {
    read -p "Enter the name of the file to delete: " filename
    if [ -e "$filename" ]; then
        rm -i "$filename"
        echo "File '$filename' deleted."
    else
        echo "File '$filename' not found."
    fi
}

# Main loop
while true; do
    display_menu
    read -p "Enter your choice (1/2/3/4): " choice
    case "$choice" in
        1) create_file ;;
        2) rename_file ;;
        3) delete_file ;;
        4) echo "Exiting. Goodbye!"; exit 0 ;;
        *) echo "Invalid choice. Please try again." ;;
    esac
    read -p "Press Enter to continue..."
done

