#!/bin/bash

# --- Config ---
LOG_FILE="logs/system_monitor.log"
INTERVAL=60

while true;do
    # Get system stats and apend to log
    ./scripts/system_stats.sh >> "$LOG_FILE"

    # Wait for next interval
    sleep $INTERVAL
done    