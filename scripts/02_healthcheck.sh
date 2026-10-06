#!/bin/bash

DISK_THRESHOLD=80
MEMORY_THRESHOLD=80

echo "================================"
echo "       SYSTEM HEALTH CHECK"
echo "================================"
echo

# Get disk usage
DISK_USAGE=$(df / | awk 'NR==2 {print $5}' | tr -d '%')

# Get memory usage
MEMORY_USAGE=$(free | awk '/Mem:/ {printf "%.0f", $3/$2 * 100}')

echo "Disk Usage: ${DISK_USAGE}%"
echo "Memory Usage: ${MEMORY_USAGE}%"
echo

# Check disk
if [ "$DISK_USAGE" -ge "$DISK_THRESHOLD" ]; then
    echo "WARNING: Disk usage is above ${DISK_THRESHOLD}%"
    DISK_STATUS=1
else
    echo "OK: Disk usage is below ${DISK_THRESHOLD}%"
    DISK_STATUS=0
fi


# Check memory
if [ "$MEMORY_USAGE" -ge "$MEMORY_THRESHOLD" ]; then

    echo "WARNING: Memory usage is above ${MEMORY_THRESHOLD}%"
    MEMORY_STATUS=1
else
    echo "OK: Memory usage is below ${MEMORY_THRESHOLD}%"
    MEMORY_STATUS=0
fi

echo

# Check running processes
PROCESS_COUNT=$(ps aux --no-headers | wc -l)

echo "Running Processes: $PROCESS_COUNT"

# Overall status
if [ "$DISK_STATUS" -eq 0 ] && [ "$MEMORY_STATUS" -eq 0 ]; then
    echo
    echo "SYSTEM STATUS: HEALTHY"
    exit 0
else
    echo
    echo "SYSTEM STATUS: WARNING"
    exit 1
fi
