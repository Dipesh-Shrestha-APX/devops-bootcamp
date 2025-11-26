#!/bin/bash

log_report() {
    if [[ ! -f "$report" ]]; then
        touch "$report"
    fi
    echo "$1" | tee -a "$report"
}

logFolder="/var/log/app_logs"

# Report file location
report="./log_rotation_report_$(date +"%Y-%m-%d").txt"

##### 0) Create directory if not exists
mkdir -p "$logFolder"

todayDate=$(date +"%Y-%m-%d")
newLog="${logFolder}/app_log_${todayDate}.log"

##### 1) Delete logs older than 30 days
echo "Removing logs older than 30 days..."
find "$logFolder" -type f -name "*.log" -mtime +30 -exec rm -f {} \;
echo "Old logs removed."
log_report "Old logs older than 30 days have been removed"

##### 2) Create today's new log file
echo "Creating today's new log file: $newLog"
touch "$newLog"
chmod 644 "$newLog"
log_report "New log file for today has been created"

##### 3) Compress yesterday's log
yesterday=$(date -d "yesterday" +"%Y-%m-%d")
yesterdayLog="${logFolder}/app_log_${yesterday}.log"

if [[ -f "$yesterdayLog" ]]; then
    gzip -f "$yesterdayLog"
    log_report "Yesterday's log has been compressed"
else
    echo "No uncompressed log found for yesterday."
    log_report "No uncompressed log found for yesterday"
fi

