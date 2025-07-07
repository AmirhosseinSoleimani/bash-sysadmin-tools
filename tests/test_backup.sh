#!/bin/bash

BACKUP_SCRIPT="../bin/backup.sh"

echo "Running test: backup README.md"

$BACKUP_SCRIPT ../README.md

if [ $? -eq 0 ]; then
    echo "Test passed: backup script ran successfully."
else
    echo "Test failed: backup script did not run successfully."
    exit 1
fi        