#!/bin/bash

STATE_FILE="/etc/pihole/pihole_update_date"
TODAY=$(date +"%Y%m%d")

if [[ -f "$STATE_FILE" ]]; then
    LASTRUN=$(cat "$STATE_FILE")
else
    LASTRUN=""
fi

if [[ -z "$LASTRUN" || "$TODAY" -gt "$LASTRUN" ]]; then
    echo "Running pihole -g..."
    pihole -g
    echo "$TODAY" > "$STATE_FILE"
else
    echo "No update needed. Last run: $LASTRUN"
fi

