#!/bin/bash

# Check for the required argument
if [ $# -ne 1 ]; then
    echo "Usage: $0 <letter>"
    exit 1
fi

# Store the input letter in a variable
letter="$1"

# Use awk to filter and format the data
awk -v letter="$letter" '{
    if (tolower(substr($1, 1, 1)) == tolower(letter)) {
        printf "%-15s %s\n", $1, $2
    }
}' countries.txt
