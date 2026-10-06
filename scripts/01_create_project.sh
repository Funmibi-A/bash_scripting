#!/bin/bash
set -euo pipefail


PROJECT_DIR="devops-project"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)


# Create directories
mkdir -p "$PROJECT_DIR/logs/archive"
mkdir -p "$PROJECT_DIR/data/raw"

# Create README, only if it doesn't exist
README="$PROJECT_DIR/README.txt"

if [ ! -f "$README" ]; then
    echo "Project created on $(date)" > "$README"
    echo "Created $README"

else
    echo "$README already exists, skipping..."
fi

# Create a timestamped log file
LOG_FILE="$PROJECT_DIR/logs/run_${TIMESTAMP}.log"

touch "$LOG_FILE"

echo "Script ran at $(date)" >> "$LOG_FILE"
echo "Wrote log: $LOG_FILE"
