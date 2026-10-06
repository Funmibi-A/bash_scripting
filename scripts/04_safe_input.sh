#!/bin/bash

set -euo pipefail

cleanup() {
    echo "Cleaning up resources..."
    echo "Cleanup completed."
}

trap cleanup EXIT

echo "================================"
echo "       SAFE DIRECTORY TOOL"
echo "================================"
echo

read -rp "Enter a directory path: " TARGET_DIR

if [ -z "$TARGET_DIR" ]; then
    echo "ERROR: Directory path cannot be empty."
    exit 1
fi

if [ ! -d "$TARGET_DIR" ]; then
    echo "ERROR: Directory does not exist."
    exit 1
fi

echo "Directory validated successfully."
echo "Path: $TARGET_DIR"
