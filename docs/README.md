# Bash System Automation Project

## 1. Project Overview

This project demonstrates practical Bash scripting and Linux automation skills.

The project covers:

* Directory and file automation
* System health monitoring
* Conditional statements
* Variables and exit codes
* Functions and function arguments
* External function libraries
* Input validation
* Bash scripting
* Trap and cleanup handling
* Professional project organization

---

## 2. Project Structure

```text
bash-system-automation/
├── scripts/
│   ├── 01_create_files.sh
│   ├── 02_system_health.sh
│   ├── 03_functions.sh
│   ├── 04_safe_input.sh
│   └── lib/
│       └── functions.sh
│
├── docs/
│   └── README.md
│
├── screenshots/
│
└── CHECKLIST.md
```

---

## 3. Task 1 — Automate Directory and File Creation

### Script

`01_create_files.sh`

### Objective

The script automates the creation of nested directories and files.

### Bash concepts used

* `mkdir -p`
* `touch`
* `echo`
* Variables
* `date`
* Conditional/idempotent operations

### Key functionality

The script creates the required directory structure and generates files containing dynamic timestamp information.

The use of `mkdir -p` allows the script to be safely re-run without generating errors when directories already exist.

### Result

The script successfully created the required directories and files.

---

## 4. Task 2 — System Health Monitor

### Script

`02_system_health.sh`

### Objective

The script monitors basic system health by collecting information about:

* Disk usage
* Memory usage
* Running processes

### Commands used

* `df`
* `free`
* `ps`
* `awk`
* `wc`

### Thresholds

The script uses defined thresholds for disk and memory usage.

```bash
DISK_THRESHOLD=80
MEMORY_THRESHOLD=80
```

### Exit codes

The script uses exit codes to indicate the result of the health check.

* `0` — System is healthy
* `1` — System requires attention

### Result

The system health monitor successfully collected system information and reported the system status based on the configured thresholds.

---

## 5. Task 3 — Refactor Using Functions

### Scripts

* `03_functions.sh`
* `lib/functions.sh`

### Objective

The system health monitoring logic was refactored into reusable Bash functions.

### Functions implemented

#### `check_disk()`

Checks disk usage against a supplied threshold.

#### `check_memory()`

Checks memory usage against a supplied threshold.

#### `show_processes()`

Counts and displays the number of running processes.

### Bash concepts demonstrated

* Functions
* Function arguments
* `$1`
* `local` variables
* `return`
* `$?`
* `source`

The external function library is loaded using:

```bash
source "$(dirname "$0")/lib/functions.sh"
```

### Result

The health monitoring logic was successfully modularized into reusable functions.

---

## 6. Task 4 — Input Validation and Safety

### Script

`04_safe_input.sh`

### Objective

The script demonstrates defensive Bash scripting and user input validation.

### Defensive settings

The script uses:

```bash
set -euo pipefail
```

These settings help detect command failures, undefined variables, and failures within pipelines.

### Input validation

The script validates:

1. Whether the user provided input.
2. Whether the supplied path exists.
3. Whether the supplied path is a directory.

### Example validation

```bash
if [ -z "$TARGET_DIR" ]; then
    echo "ERROR: Directory path cannot be empty."
    exit 1
fi
```

The directory is also validated using:

```bash
if [ ! -d "$TARGET_DIR" ]; then
    echo "ERROR: Directory does not exist."
    exit 1
fi
```

### Trap and cleanup

The script uses:

```bash
trap cleanup EXIT
```

This ensures that the cleanup function is executed when the script exits.

### Result

The script successfully rejects invalid input and validates valid directory paths before continuing.

---

## 7. Testing and Evidence

The scripts were tested in a Linux environment.

Testing included:

* Successful directory and file creation
* System health monitoring
* Disk usage checks
* Memory usage checks
* Process counting
* Function execution
* Exit code verification
* Empty input validation
* Invalid directory validation
* Valid directory validation
* Cleanup using `trap`

Screenshots and terminal output are stored in the `screenshots/` directory.

