#!/bin/bash

source "$(dirname "$0")/lib/functions.sh"

DISK_THRESHOLD=80
MEMORY_THRESHOLD=80

check_disk "$DISK_THRESHOLD"

DISK_STATUS=$?

check_memory "$MEMORY_THRESHOLD"

MEMORY_STATUS=$?

show_processes


echo

if [ "$DISK_STATUS" -eq 0 ] && [ "$MEMORY_STATUS" -eq 0 ]; then
    echo "SYSTEM STATUS: HEALTHY"
    exit 0
else
    echo "SYSTEM STATUS: WARNING"
    exit 1
fi
