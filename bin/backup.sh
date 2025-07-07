#!/bin/bash

# === Config ===
SOURCE="$1"
DEST="./logs"
NOW=$(date +"%Y-%m-%d_%H-%M-%S")
ARCHIVE_NAME="backup_$NOW.tar.gz"
LOG_FILE="logs/backup.log"

# === Validate ===
if [ -z "$SOURCE" ]; then
    echo "Usage: $0 <source_directory_or_file>"
    exit 1
fi

if [ ! -e "$SOURCE" ]; then
    echo "Error: Source path '$SOURCE' does not exists."
    exit 1
fi

# === Action ===
tar -czf "$DEST/$ARCHIVE_NAME" "$SOURCE"
STATUS=$?

# === Logging ===
if [ $STATUS -eq 0 ]; then
    echo "$(date): Backup of '$SOURCE' completed successfully -> $DEST/$ARCHIVE_NAME" >> "$LOG_FILE"
    echo " Backup done: $DEST/$ARCHIVE_NAME"
else
    echo "$(date): Backup failed for '$SOURCE'" >> "$LOG_FILE"
    echo " Backup failed."
fi        