#!/bin/bash

# Default idle time threshold in seconds (15 minutes = 900 seconds)
default_idle_threshold=900

# Use IDLE_TIME environment variable if set, otherwise use default
# To set a custom idle time, run `export IDLE_TIME=your_value` in the terminal
idle_threshold=${IDLE_TIME:-$default_idle_threshold}

# Get the directory of the current script
script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# Path to your AppleScript file, assuming it's in the same directory as this script
applescript_path="$script_dir/sleeper_execute.scpt"

# Check if the AppleScript file exists
if [ ! -f "$applescript_path" ]; then
    echo "Error: AppleScript file not found at $applescript_path"
    exit 1
fi

while true; do
    # Get the current idle time in seconds
    idle_time=$(ioreg -c IOHIDSystem | awk '/HIDIdleTime/ {print int($NF/1000000000); exit}')

    # Check if the idle time exceeds the threshold
    if [ "$idle_time" -gt "$idle_threshold" ]; then
        # Trigger the AppleScript to put the MacBook to sleep
        osascript "$applescript_path"
    fi

    # Wait for a minute before checking again
    sleep 60
done
