#!/bin/bash

check_disk() {
    local threshold="$1"

    local usage
    usage=$(df / | awk 'NR==2 {print $5}' | tr -d '%')

    echo "Disk Usage: ${usage}%"

    if [ "$usage" -ge "$threshold" ]; then
        echo "WARNING: Disk usage is above ${threshold}%"
        return 1
    else
        echo "OK: Disk usage is below ${threshold}%"
        return 0
    fi
}

check_memory() {
    local threshold="$1"

    local usage
    usage=$(free | awk '/Mem:/ {printf "%.0f", $3/$2 * 100}')

    echo "Memory Usage: ${usage}%"

    if [ "$usage" -ge "$threshold" ]; then
        echo "WARNING: Memory usage is above ${threshold}%"
        return 1
    else
        echo "OK: Memory usage is below ${threshold}%"
        return 0
    fi
}


show_processes() {
    local process_count

    process_count=$(ps aux --no-headers | wc -l)

    echo "Running Processes: $process_count"
}
