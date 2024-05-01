#!/bin/bash

# Base URL for downloading files
BASE_URL="https://raw.githubusercontent.com/jeromenatio/solana-bases/main/scripts/"

# Default directory where binaries will be stored
BIN_DIR="/usr/local/bin"

# Function to find an alternative binaries directory starting with /usr/
find_alternative_bin_dir() {
    echo "Checking for alternative binaries directory starting with /usr/..."
    IFS=':' read -ra PATHS <<< "$PATH"
    for path in "${PATHS[@]}"; do
        if [[ "$path" == /usr/* ]] && [[ -d "$path" ]] && [[ -w "$path" ]]; then
            echo "Found writable directory: $path"
            return 0
        fi
    done
    echo "No writable directory found under /usr/ in PATH."
    return 1
}

# Check if BIN_DIR exists and is writable
if [[ ! -d "$BIN_DIR" ]] || [[ ! -w "$BIN_DIR" ]]; then
    echo "$BIN_DIR does not exist or is not writable."
    # Try to find an alternative directory
    if find_alternative_bin_dir; then
        BIN_DIR="$path"  # Update BIN_DIR to the found path
    else
        echo "Failed to find an alternative directory. Please create $BIN_DIR manually or run the script as superuser."
        exit 1
    fi
else
    echo "Using directory: $BIN_DIR"
fi

# List of file names to download
declare -a files=(
    "tn-disk.sh"
)

# Ensure the binary directory exists
mkdir -p "$BIN_DIR"

# Loop through each file name to download and configure
for file_name in "${files[@]}"; do
    # Download the file
    wget -q -O "$BIN_DIR/$file_name" "${BASE_URL}${file_name}"
    
    # Make the file executable
    chmod +x "$BIN_DIR/$file_name"
done

echo "All files have been downloaded and configured."
