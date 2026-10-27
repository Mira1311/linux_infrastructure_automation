#!/bin/bash

# Define variables
LOG_FILE="/tmp/system_health.log"
ARCHIVE_DIR="/tmp/archives"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)

# Ensure archive directory exists
mkdir -p $ARCHIVE_DIR

# Copy the current log to the archive folder with a timestamp
cp $LOG_FILE $ARCHIVE_DIR/health_$TIMESTAMP.log

# Empty the original log file without deleting it
> $LOG_FILE

echo "Log rotated at $TIMESTAMP"

