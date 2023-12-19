#!/bin/bash

# Loop through all Markdown files in the current directory
for file in *.md; do
    # Check if there are any matching files
    if [ -e "$file" ]; then
        # Extract the base name without the extension
        base_name=$(basename "$file" .md)
        
        # Convert Markdown to plain text using Pandoc
        pandoc "$file" -o "${base_name}.txt"
        
        # Print a message indicating the conversion
        echo "Converted $file to ${base_name}.txt"
    else
        # Print a message if no matching files are found
        echo "No Markdown files found in the current directory."
        exit 1
    fi
done

