#!/bin/bash

# System Health Monitoring Script

# Thresholds
CPU_THRESHOLD=80
MEM_THRESHOLD=80
DISK_THRESHOLD=80

# CPU Usage: Get the percentage of CPU used
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')

# Memory Usage: Get the percentage of memory used
MEM_USAGE=$(free | grep Mem | awk '{print $3/$2 * 100.0}')

# Disk Usage: Get the percentage of disk used on root "/"
DISK_USAGE=$(df / | grep / | awk '{ print $5 }' | sed 's/%//g')

# Check and alert
echo "Checking system health..."
if (( $(echo "$CPU_USAGE > $CPU_THRESHOLD" | bc -l) )); then
  echo "CPU usage is above threshold at ${CPU_USAGE}%"
fi

if (( $(echo "$MEM_USAGE > $MEM_THRESHOLD" | bc -l) )); then
  echo "Memory usage is above threshold at ${MEM_USAGE}%"
fi

if (( $(echo "$DISK_USAGE > $DISK_THRESHOLD" | bc -l) )); then
  echo "Disk usage is above threshold at ${DISK_USAGE}%"
fi

# Optionally, check for a high number of running processes
# Adjust the threshold as necessary
PROCESS_THRESHOLD=200
PROCESS_COUNT=$(ps -aux | wc -l)
if [ "$PROCESS_COUNT" -gt "$PROCESS_THRESHOLD" ]; then
  echo "High number of running processes: ${PROCESS_COUNT}"
fi

echo "System health check complete."
